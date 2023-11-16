#![allow(unused_imports)]

use crate::codegen::ir::pack::IrPack;
use crate::codegen::ir::ty::boxed::IrTypeBoxed;
use crate::codegen::ir::ty::dart_opaque::IrTypeDartOpaque;
use crate::codegen::ir::ty::delegate::IrTypeDelegate;
use crate::codegen::ir::ty::dynamic::IrTypeDynamic;
use crate::codegen::ir::ty::enumeration::IrTypeEnumRef;
use crate::codegen::ir::ty::general_list::IrTypeGeneralList;
use crate::codegen::ir::ty::optional::IrTypeOptional;
use crate::codegen::ir::ty::optional_list::IrTypeOptionalList;
use crate::codegen::ir::ty::primitive::IrTypePrimitive;
use crate::codegen::ir::ty::primitive_list::IrTypePrimitiveList;
use crate::codegen::ir::ty::record::IrTypeRecord;
use crate::codegen::ir::ty::rust_opaque::IrTypeRustOpaque;
use crate::codegen::ir::ty::structure::IrTypeStructRef;
use crate::codegen::ir::ty::unencodable::IrTypeUnencodable;
use crate::codegen::ir::ty::IrType;
use crate::codegen::ir::ty::IrType::*;
use enum_dispatch::enum_dispatch;
use paste::paste;

macro_rules! generate_code {
    ($($name:ident),*,) => (
        paste! {
            #[enum_dispatch(DartApiClassGeneratorTrait)]
            pub(crate) enum DartApiGenerator<'a> {
                $(
                    $name([<$name DartApiGenerator>]<'a>),
                )*
            }

            impl<'a> DartApiGenerator<'a> {
                pub(crate) fn new(ty: IrType, ir_pack: &'a IrPack) -> Option<Self> {
                    let context = DartApiGeneratorContext { ir_pack };
                    Some(match ty {
                        $(
                            $name(ir) => Self::$name([<$name DartApiGenerator>]::new(ir, context)),
                        )*
                    })
                }
            }

            $(
                #[derive(Debug, Clone)]
                pub(crate) struct [<$name DartApiGenerator>]<'a> {
                    ir: [<IrType $name>],
                    context: DartApiGeneratorContext<'a>,
                }

                impl<'a> [<$name DartApiGenerator>]<'a> {
                    pub(crate) fn new(ir: [<IrType $name>], context: DartApiGeneratorContext<'a>) -> Self {
                        Self { ir, context }
                    }
                }
            )*
        }
    )
}

generate_code!(
    Boxed,
    DartOpaque,
    Delegate,
    Dynamic,
    EnumRef,
    GeneralList,
    Optional,
    OptionalList,
    Primitive,
    PrimitiveList,
    Record,
    RustOpaque,
    StructRef,
    Unencodable,
);

#[derive(Debug, Clone)]
pub(crate) struct DartApiGeneratorContext<'a> {
    ir_pack: &'a IrPack,
}
