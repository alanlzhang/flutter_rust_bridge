use crate::codegen::generator::wire::dart::spec_generator::api2wire::WireDartOutputSpecApi2wire;
use crate::codegen::generator::wire::dart::spec_generator::base::WireDartGeneratorContext;
use crate::codegen::generator::wire::dart::spec_generator::misc::WireDartOutputSpecMisc;
use crate::codegen::generator::wire::dart::spec_generator::output_code::WireDartOutputCode;
use crate::codegen::generator::wire::dart::spec_generator::wire2api::WireDartOutputSpecWire2api;
use crate::codegen::ir::pack::IrPackComputedCache;

pub mod api2wire;
pub(crate) mod base;
pub mod c_binding;
mod function;
pub(crate) mod misc;
pub(crate) mod output_code;
pub mod wire2api;

pub(crate) struct WireDartOutputSpec {
    pub(super) c_binding: WireDartOutputCode,
    pub(super) misc: WireDartOutputSpecMisc,
    pub(super) wire2api: WireDartOutputSpecWire2api,
    pub(super) api2wire: WireDartOutputSpecApi2wire,
}

pub(crate) fn generate(
    context: WireDartGeneratorContext,
    c_file_content: &str,
) -> anyhow::Result<WireDartOutputSpec> {
    let cache = IrPackComputedCache::compute(context.ir_pack);
    Ok(WireDartOutputSpec {
        c_binding: c_binding::generate(&context.config, c_file_content)?,
        misc: misc::generate(context, &cache),
        wire2api: wire2api::generate(context, &cache),
        api2wire: api2wire::generate(context, &cache),
    })
}
