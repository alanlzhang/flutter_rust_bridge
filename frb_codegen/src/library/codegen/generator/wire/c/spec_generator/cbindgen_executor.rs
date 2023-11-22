use crate::codegen::generator::misc::target::TargetOrCommon;
use crate::codegen::generator::misc::{PathText, PathTexts};
use crate::codegen::generator::wire::c::internal_config::GeneratorWireCInternalConfig;
use crate::library::commands::cbindgen::{cbindgen, CbindgenArgs};
use crate::utils::file_utils::temp_change_file;
use anyhow::ensure;
use itertools::Itertools;

pub(crate) fn execute(
    config: &GeneratorWireCInternalConfig,
    extern_struct_names: Vec<String>,
    rust_output_texts: &PathTexts,
) -> anyhow::Result<String> {
    let changed_file_handles = rust_output_texts
        .0
        .iter()
        .map(|rust_output_text| {
            temp_change_file(rust_output_text.path.clone(), |_| {
                rust_output_text.text.clone()
            })
        })
        .collect::<anyhow::Result<Vec<_>>>()?;

    let ans = cbindgen(CbindgenArgs {
        rust_crate_dir: &config.rust_crate_dir,
        c_struct_names: extern_struct_names,
        // TODO will try to avoid manually specify exclude_symbols by using `pub(crate)` instead of `pub`
        // exclude_symbols: generated_rust.get_exclude_symbols(all_symbols),
        exclude_symbols: vec![],
        after_includes: "typedef struct DartCObject *WireSyncReturn;".to_owned(),
    })?;

    drop(changed_file_handles); // do not drop too early

    Ok(ans)
}
