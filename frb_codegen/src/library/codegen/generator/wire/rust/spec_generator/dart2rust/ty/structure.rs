use crate::codegen::generator::acc::Acc;
use crate::codegen::generator::misc::target::Target;
use crate::codegen::generator::wire::rust::spec_generator::base::*;
use crate::codegen::generator::wire::rust::spec_generator::dart2rust::impl_new_with_nullptr::generate_impl_new_with_nullptr_code_block;
use crate::codegen::generator::wire::rust::spec_generator::dart2rust::misc::{
    generate_class_from_fields, rust_wire_type_add_prefix_or_js_value,
};
use crate::codegen::generator::wire::rust::spec_generator::dart2rust::ty::WireRustGeneratorDart2RustTrait;
use crate::codegen::generator::wire::rust::spec_generator::output_code::WireRustOutputCode;
use crate::codegen::ir::ty::{IrType, IrTypeTrait};
use itertools::Itertools;

impl<'a> WireRustGeneratorDart2RustTrait for StructRefWireRustGenerator<'a> {
    fn generate_wire2api_class(&self) -> Option<String> {
        let s = self.ir.get(self.context.ir_pack);
        Some(generate_class_from_fields(
            self.ir.clone(),
            self.context,
            &s.fields
                .iter()
                .map(|field| {
                    let field_generator = WireRustGenerator::new(field.ty.clone(), self.context);
                    format!(
                        "{}: {}{}",
                        field.name.rust_style(),
                        field_generator.rust_wire_modifier(Target::Io),
                        field_generator.rust_wire_type(Target::Io)
                    )
                })
                .collect_vec(),
        ))
    }

    fn generate_impl_wire2api_body(&self) -> Acc<Option<String>> {
        let api_struct = self.ir.get(self.context.ir_pack);
        let fields: Acc<Vec<_>> = api_struct
            .fields
            .iter()
            .enumerate()
            .map(|(idx, field)| {
                let field_name = field.name.rust_style();
                let field_ = if api_struct.is_fields_named {
                    format!("{field_name}: ")
                } else {
                    String::new()
                };

                Acc {
                    wasm: format!("{field_} self_.get({idx}).wire2api()"),
                    io: format!("{field_} self.{field_name}.wire2api()"),
                    ..Default::default()
                }
            })
            .collect();

        let (left, right) = api_struct.brackets_pair();
        let rust_api_type = self.ir.rust_api_type();
        Acc {
            io: Some(format!(
                "
                {rust_api_type}{left}{fields}{right}
                ",
                fields = fields.io.join(","),
            )),
            wasm: Some(format!(
                "
                let self_ = self.dyn_into::<flutter_rust_bridge::for_generated::js_sys::Array>().unwrap();
                assert_eq!(self_.length(), {len}, \"Expected {len} elements, got {{}}\", self_.length());
                {rust_api_type}{left}{fields}{right}
                ",
                fields = fields.wasm.join(","),
                len = api_struct.fields.len(),
            )),
            ..Default::default()
        }
    }

    fn generate_impl_new_with_nullptr(&self) -> Option<WireRustOutputCode> {
        let src = self.ir.get(self.context.ir_pack);

        let body = {
            src.fields
                .iter()
                .map(|field| {
                    format!(
                        "{}: {},",
                        field.name.rust_style(),
                        if WireRustGenerator::new(field.ty.clone(), self.context)
                            .rust_wire_is_pointer(Target::Io)
                            || matches!(field.ty, IrType::RustOpaque(_) | IrType::DartOpaque(_))
                        {
                            "core::ptr::null_mut()".to_owned()
                        } else {
                            "Default::default()".to_owned()
                        }
                    )
                })
                .collect_vec()
                .join("\n")
        };

        Some(
            generate_impl_new_with_nullptr_code_block(
                self.ir.clone(),
                self.context,
                &format!("Self {{ {body} }}"),
                true,
            )
            .into(),
        )
    }

    fn rust_wire_type(&self, target: Target) -> String {
        rust_wire_type_add_prefix_or_js_value(&self.ir, target)
    }
}
