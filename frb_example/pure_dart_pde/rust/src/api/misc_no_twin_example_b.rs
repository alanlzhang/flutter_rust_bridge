// AUTO-GENERATED FROM frb_example/pure_dart, DO NOT EDIT

// FRB_INTERNAL_GENERATOR: {"forbiddenDuplicatorModes": ["sync", "rustAsync", "sse", "sync sse", "rustAsync sse"]}

use crate::api::misc_no_twin_example_a::{
    StructInMiscNoTwinExampleA, StructWithImplBlockInMultiFile,
};
use flutter_rust_bridge::frb;

// Reproduce #1630
#[frb(opaque)]
pub struct StructInMiscNoTwinExampleB {}

impl StructInMiscNoTwinExampleB {
    pub async fn get_struct_in_misc_no_twin_example_a(&self) -> StructInMiscNoTwinExampleA {
        StructInMiscNoTwinExampleA {}
    }

    pub async fn sample_function_b(&self) {}
}

impl StructWithImplBlockInMultiFile {
    pub fn method_in_b(&self) {}
}
