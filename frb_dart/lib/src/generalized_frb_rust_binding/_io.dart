import 'dart:ffi' as ffi;

import 'package:flutter_rust_bridge/src/ffigen_generated/multi_package.dart';
import 'package:flutter_rust_bridge/src/platform_types/_io.dart';
import 'package:flutter_rust_bridge/src/platform_types/platform_types.dart';

/// {@macro flutter_rust_bridge.only_for_generated_code}
class GeneralizedFrbRustBinding {
  final MultiPackageCBinding _binding;
  final String _externalLibraryDebugInfo;

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  GeneralizedFrbRustBinding(ExternalLibrary externalLibrary)
      : _binding = MultiPackageCBinding(externalLibrary.ffiDynamicLibrary),
        _externalLibraryDebugInfo = externalLibrary.debugInfo;

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  void storeDartPostCObject() {
    try {
      _binding.store_dart_post_cobject(ffi.NativeApi.postCObject.cast());
    } on ArgumentError catch (e, s) {
      _userFriendlyDynamicLibraryErrorReporting(e, s);
      rethrow;
    }
  }

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  void initFrbDartApiDl() =>
      _binding.init_frb_dart_api_dl(ffi.NativeApi.initializeApiDLData);

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  Object dartOpaqueRust2DartDecode(int ptr) =>
      _binding.dart_opaque_rust2dart_decode(ptr);

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  void dartOpaqueDropThreadBoxPersistentHandle(int ptr) =>
      _binding.dart_opaque_drop_thread_box_persistent_handle(ptr);

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  void freeWireSyncReturnDco(WireSyncReturnDco val) =>
      _binding.free_wire_sync_return_dco(val);

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  void freeWireSyncReturnSse(WireSyncReturnSse val) =>
      _binding.free_wire_sync_return_sse(val);

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  PlatformU8Pointer rustVecU8New(int len) => _binding.rust_vec_u8_new(len);

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  PlatformU8Pointer rustVecU8Resize(
          PlatformU8Pointer ptr, int oldLen, int newLen) =>
      _binding.rust_vec_u8_resize(ptr, oldLen, newLen);

  /// {@macro flutter_rust_bridge.only_for_generated_code}
  void rustVecU8Free(ffi.Pointer<ffi.Uint8> ptr, int len) =>
      _binding.rust_vec_u8_free(ptr, len);

  void _userFriendlyDynamicLibraryErrorReporting(
      ArgumentError e, StackTrace s) {
    final message = e.message;
    if (message is String && message.contains('Failed to lookup symbol')) {
      throw ArgumentError(
        '$e\n'
        'This is often because the Rust library is not loaded correctly.\n'
        'Debug information of the external library: $_externalLibraryDebugInfo\n'
        'Original stack trace: $s',
      );
    }
  }
}
