use crate::codegen::generator::acc::Acc;
use crate::codegen::generator::misc::target::{Target, TargetOrCommon};
use crate::codegen::generator::wire::dart::spec_generator::api2wire::ty::WireDartGeneratorApi2wireTrait;
use crate::codegen::generator::wire::dart::spec_generator::base::*;
use crate::codegen::ir::ty::delegate::{
    IrTypeDelegate, IrTypeDelegateArray, IrTypeDelegateArrayMode, IrTypeDelegatePrimitiveEnum,
    IrTypeDelegateTime,
};
use crate::codegen::ir::ty::primitive::IrTypePrimitive;
use crate::codegen::ir::ty::primitive_list::IrTypePrimitiveList;
use crate::library::codegen::generator::api_dart::spec_generator::base::ApiDartGenerator;
use crate::library::codegen::generator::api_dart::spec_generator::info::ApiDartGeneratorInfoTrait;
use crate::library::codegen::ir::ty::IrTypeTrait;

impl<'a> WireDartGeneratorApi2wireTrait for DelegateWireDartGenerator<'a> {
    fn api2wire_body(&self) -> Acc<Option<String>> {
        match &self.ir {
            IrTypeDelegate::Array(ref array) => match &array.mode {
                IrTypeDelegateArrayMode::General(_) => Acc::distribute(Some(format!(
                    "return api2wire_{}(raw);",
                    array.get_delegate().safe_ident(),
                ))),
                IrTypeDelegateArrayMode::Primitive(_) => Acc {
                    io: Some(format!(
                        "final ans = wire.new_{}({length});
                        ans.ref.ptr.asTypedList({length}).setAll(0, raw);
                        return ans;",
                        array.get_delegate().safe_ident(),
                        length = array.length,
                    )),
                    wasm: Some(format!(
                        "return {}.fromList(raw);",
                        ApiDartGenerator::new(
                            array.get_delegate().clone(),
                            self.context.as_api_dart_context()
                        )
                        .dart_api_type()
                    )),
                    ..Default::default()
                },
            },

            IrTypeDelegate::String => Acc {
                io: Some(format!(
                    "return api2wire_{}(utf8.encoder.convert(raw));",
                    uint8list_safe_ident()
                )),
                wasm: Some("return raw;".into()),
                ..Default::default()
            },
            IrTypeDelegate::ZeroCopyBufferVecPrimitive(_) => {
                // In this case, even though the body is the same, their types are different
                // and must be split.
                let body = format!(
                    "return api2wire_{}(raw);",
                    self.ir.get_delegate().safe_ident()
                );
                Acc::distribute(Some(body))
            }
            IrTypeDelegate::StringList => Acc {
                io: Some(format!(
                    "final ans = wire.new_StringList(raw.length);
                    for (var i = 0; i < raw.length; i++){{
                        ans.ref.ptr[i] = api2wire_String(raw[i]);
                    }}
                    return ans;",
                )),
                wasm: Some("return raw;".into()),
                ..Default::default()
            },
            IrTypeDelegate::PrimitiveEnum(IrTypeDelegatePrimitiveEnum { ref repr, .. }) => {
                format!("return api2wire_{}(raw.index);", repr.safe_ident()).into()
            }
            IrTypeDelegate::Time(ir) => match ir {
                IrTypeDelegateTime::Utc | IrTypeDelegateTime::Local | IrTypeDelegateTime::Naive => {
                    Acc {
                        io: Some(
                            "return api2wire_i_64(BigInt.from(raw.microsecondsSinceEpoch));".into(),
                        ),
                        wasm: Some(
                            "return api2wire_i_64(BigInt.from(raw.millisecondsSinceEpoch));".into(),
                        ),
                        ..Default::default()
                    }
                }
                IrTypeDelegateTime::Duration => Acc {
                    io: Some("return api2wire_i_64(BigInt.from(raw.inMicroseconds));".into()),
                    wasm: Some("return api2wire_i_64(BigInt.from(raw.inMilliseconds));".into()),
                    ..Default::default()
                },
            },
            IrTypeDelegate::TimeList(t) => Acc::distribute(Some(format!(
                "final ans = Int64List(raw.length);
                for (var i=0; i < raw.length; ++i) ans[i] = api2wire_{}(raw[i]);
                return api2wire_list_prim_i_64(ans);",
                IrTypeDelegate::Time(t.clone()).safe_ident()
            ))),
            IrTypeDelegate::Uuid => Acc::distribute(Some(format!(
                "return api2wire_{}(raw.toBytes());",
                uint8list_safe_ident()
            ))),
            IrTypeDelegate::Uuids => Acc::distribute(Some(format!(
                "return api2wire_{}(api2wireConcatenateBytes(raw));",
                uint8list_safe_ident()
            ))),
            IrTypeDelegate::Backtrace => unimplemented!(),
            IrTypeDelegate::Anyhow => unimplemented!(),
        }
    }

    fn dart_wire_type(&self, target: Target) -> String {
        match (&self.ir, target) {
            (IrTypeDelegate::String, Target::Wasm) => "String".into(),
            (IrTypeDelegate::StringList, Target::Wasm) => "List<String>".into(),
            (IrTypeDelegate::StringList, _) => "ffi.Pointer<wire_StringList>".to_owned(),
            _ => WireDartGenerator::new(self.ir.get_delegate().clone(), self.context)
                .dart_wire_type(target),
        }
    }
}

fn uint8list_safe_ident() -> String {
    IrTypePrimitiveList {
        primitive: IrTypePrimitive::U8,
    }
    .safe_ident()
}
