use crate::codegen::generator::misc::Target;
use crate::codegen::generator::wire::dart::spec_generator::base::WireDartGeneratorImplTrait;
use crate::codegen::generator::wire::rust::spec_generator::base::WireRustGenerator;

pub(super) fn dart_wire_type_from_rust_wire_type_or_wasm(
    that: impl WireDartGeneratorImplTrait,
    target: Target,
    wasm_type: String,
) -> String {
    match target {
        Target::Io => WireRustGenerator::new(
            that.ir_type().clone(),
            that.context().as_wire_rust_context(),
        )
        .rust_wire_type(target),
        Target::Wasm => wasm_type,
    }
}
