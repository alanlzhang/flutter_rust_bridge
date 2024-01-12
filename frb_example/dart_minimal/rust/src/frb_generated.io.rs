// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.16.

// Section: imports

use super::*;
use crate::api::minimal::*;
use flutter_rust_bridge::for_generated::byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use flutter_rust_bridge::for_generated::transform_result_dco;
use flutter_rust_bridge::{Handler, IntoIntoDart};

// Section: dart2rust

impl
    CstDecode<
        flutter_rust_bridge::RustOpaque<
            flutter_rust_bridge::for_generated::rust_async::RwLock<Apple>,
        >,
    > for *const std::ffi::c_void
{
    fn cst_decode(
        self,
    ) -> flutter_rust_bridge::RustOpaque<
        flutter_rust_bridge::for_generated::rust_async::RwLock<Apple>,
    > {
        unsafe { flutter_rust_bridge::for_generated::decode_rust_opaque_nom(self as _) }
    }
}
pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

#[no_mangle]
pub extern "C" fn frbgen_frb_example_dart_minimal_dart_fn_deliver_output(
    call_id: i32,
    ptr_: *mut u8,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    let message = unsafe {
        flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
            ptr_,
            rust_vec_len_,
            data_len_,
        )
    };
    FLUTTER_RUST_BRIDGE_HANDLER.dart_fn_handle_output(call_id, message)
}

#[no_mangle]
pub extern "C" fn frbgen_frb_example_dart_minimal_wire_Apple_apple_method_ref(
    port_: i64,
    that: *const std::ffi::c_void,
) {
    wire_Apple_apple_method_ref_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn frbgen_frb_example_dart_minimal_wire_init_app(port_: i64) {
    wire_init_app_impl(port_)
}

#[no_mangle]
pub extern "C" fn frbgen_frb_example_dart_minimal_wire_minimal_adder(port_: i64, a: i32, b: i32) {
    wire_minimal_adder_impl(port_, a, b)
}

#[no_mangle]
pub extern "C" fn frbgen_frb_example_dart_minimal_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockApple(
    ptr: *const std::ffi::c_void,
) {
    unsafe {
        <flutter_rust_bridge::for_generated::NomRustOpaqueCodec as flutter_rust_bridge::for_generated::BaseRustOpaqueCodec<flutter_rust_bridge::for_generated::rust_async::RwLock<Apple>>>::Arc::increment_strong_count(ptr as _);
    }
}

#[no_mangle]
pub extern "C" fn frbgen_frb_example_dart_minimal_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedrust_asyncRwLockApple(
    ptr: *const std::ffi::c_void,
) {
    unsafe {
        <flutter_rust_bridge::for_generated::NomRustOpaqueCodec as flutter_rust_bridge::for_generated::BaseRustOpaqueCodec<flutter_rust_bridge::for_generated::rust_async::RwLock<Apple>>>::Arc::decrement_strong_count(ptr as _);
    }
}
