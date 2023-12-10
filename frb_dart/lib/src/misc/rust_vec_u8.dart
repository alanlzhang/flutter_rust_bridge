import 'dart:typed_data';

import 'package:flutter_rust_bridge/src/generalized_frb_rust_binding/generalized_frb_rust_binding.dart';
import 'package:flutter_rust_bridge/src/platform_types/platform_types.dart';

/// The Rust `std::Vec<u8>` on the Dart side.
/// Must call `dispose` manually, otherwise the memory will be leaked.
class RustVecU8 {
  /// Null = already disposed (to avoid accidential double free)
  PlatformU8Pointer? _ptr;

  /// {@macro flutter_rust_bridge.internal}
  int get length => _length;
  int _length;

  /// {@macro flutter_rust_bridge.internal}
  final GeneralizedFrbRustBinding binding;

  Uint8List? _cachedView;

  /// {@macro flutter_rust_bridge.internal}
  RustVecU8(this._length, this.binding) : _ptr = binding.rustVecU8New(_length) {
    _computeCachedView();
  }

  /// {@macro flutter_rust_bridge.internal}
  void resize(int newLen) {
    _ptr = binding.rustVecU8Resize(_ptr!, _length, newLen);
    _length = newLen;
    _computeCachedView();
  }

  /// {@macro flutter_rust_bridge.internal}
  ({PlatformU8Pointer ptr, int length}) intoRaw() {
    final ptr = _ptr!;
    final length = _length;
    _forget();
    return (ptr: ptr, length: length);
  }

  /// {@macro flutter_rust_bridge.internal}
  void dispose() {
    // Set ptr to null before calling free to avoid potential
    // double-free when error happens
    final ptr = _ptr!;
    _forget();
    binding.rustVecU8Free(ptr, length);
  }

  void _forget() {
    _ptr = null;
    _length = 0;
    _cachedView = null;
  }

  /// {@macro flutter_rust_bridge.internal}
  void operator []=(int index, int value) {
    _ptr![index] = value;
  }

  /// {@macro flutter_rust_bridge.internal}
  void setRange(int start, int end, Uint8List data) {
    _cachedView!.setRange(start, end, data);
  }

  void _computeCachedView() {
    _cachedView = _ptr!.asTypedList(length);
  }
}
