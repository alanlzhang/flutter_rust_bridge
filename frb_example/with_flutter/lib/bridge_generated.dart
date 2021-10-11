// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'dart:ffi' as ffi;

abstract class FlutterRustBridgeExample extends FlutterRustBridgeBase<FlutterRustBridgeExampleWire> {
  factory FlutterRustBridgeExample(ffi.DynamicLibrary dylib) =>
      FlutterRustBridgeExampleImpl.raw(FlutterRustBridgeExampleWire(dylib));

  FlutterRustBridgeExample.raw(FlutterRustBridgeExampleWire inner) : super(inner);

  Future<Uint8List> drawMandelbrot(
      {required Size imageSize, required Point zoomPoint, required double scale, required int numThreads});

  Future<String> passingComplexStructs({required TreeNode root});

  Future<int> offTopicMemoryTestInputArray({required Uint8List input});

  Future<Uint8List> offTopicMemoryTestOutputZeroCopyBuffer({required int len});

  Future<Uint8List> offTopicMemoryTestOutputVecU8({required int len});

  Future<int> offTopicMemoryTestInputVecOfObject({required List<Size> input});

  Future<List<Size>> offTopicMemoryTestOutputVecOfObject({required int len});

  Future<int> offTopicMemoryTestInputComplexStruct({required TreeNode input});

  Future<TreeNode> offTopicMemoryTestOutputComplexStruct({required int len});
}

class Size {
  final int width;
  final int height;

  Size({
    required this.width,
    required this.height,
  });
}

class Point {
  final double x;
  final double y;

  Point({
    required this.x,
    required this.y,
  });
}

class TreeNode {
  final String name;
  final List<TreeNode> children;

  TreeNode({
    required this.name,
    required this.children,
  });
}

// ------------------------- Implementation Details -------------------------

/// Implementations for FlutterRustBridgeExample. Prefer using FlutterRustBridgeExample if possible; but this class allows more
/// flexible customizations (such as subclassing to create an initializer, a logger, or
/// a timer).
class FlutterRustBridgeExampleImpl extends FlutterRustBridgeExample {
  FlutterRustBridgeExampleImpl.raw(FlutterRustBridgeExampleWire inner) : super.raw(inner);

  Future<Uint8List> drawMandelbrot(
          {required Size imageSize, required Point zoomPoint, required double scale, required int numThreads}) =>
      execute(
          (port) => inner.wire_draw_mandelbrot(port, _api2wire_box_autoadd_size(imageSize),
              _api2wire_box_autoadd_point(zoomPoint), _api2wire_f64(scale), _api2wire_i32(numThreads)),
          _wire2api_ZeroCopyBuffer_Uint8List);

  Future<String> passingComplexStructs({required TreeNode root}) => execute(
      (port) => inner.wire_passing_complex_structs(port, _api2wire_box_autoadd_tree_node(root)), _wire2api_String);

  Future<int> offTopicMemoryTestInputArray({required Uint8List input}) => execute(
      (port) => inner.wire_off_topic_memory_test_input_array(port, _api2wire_uint_8_list(input)), _wire2api_i32);

  Future<Uint8List> offTopicMemoryTestOutputZeroCopyBuffer({required int len}) => execute(
      (port) => inner.wire_off_topic_memory_test_output_zero_copy_buffer(port, _api2wire_i32(len)),
      _wire2api_ZeroCopyBuffer_Uint8List);

  Future<Uint8List> offTopicMemoryTestOutputVecU8({required int len}) => execute(
      (port) => inner.wire_off_topic_memory_test_output_vec_u8(port, _api2wire_i32(len)), _wire2api_uint_8_list);

  Future<int> offTopicMemoryTestInputVecOfObject({required List<Size> input}) => execute(
      (port) => inner.wire_off_topic_memory_test_input_vec_of_object(port, _api2wire_list_size(input)), _wire2api_i32);

  Future<List<Size>> offTopicMemoryTestOutputVecOfObject({required int len}) => execute(
      (port) => inner.wire_off_topic_memory_test_output_vec_of_object(port, _api2wire_i32(len)), _wire2api_list_size);

  Future<int> offTopicMemoryTestInputComplexStruct({required TreeNode input}) => execute(
      (port) => inner.wire_off_topic_memory_test_input_complex_struct(port, _api2wire_box_autoadd_tree_node(input)),
      _wire2api_i32);

  Future<TreeNode> offTopicMemoryTestOutputComplexStruct({required int len}) => execute(
      (port) => inner.wire_off_topic_memory_test_output_complex_struct(port, _api2wire_i32(len)), _wire2api_tree_node);

  // Section: api2wire
  ffi.Pointer<wire_Size> _api2wire_box_autoadd_size(Size raw) {
    final ptr = inner.new_box_autoadd_size();
    _api_fill_to_wire_size(raw, ptr.ref);
    return ptr;
  }

  int _api2wire_i32(int raw) {
    return raw;
  }

  ffi.Pointer<wire_Point> _api2wire_box_autoadd_point(Point raw) {
    final ptr = inner.new_box_autoadd_point();
    _api_fill_to_wire_point(raw, ptr.ref);
    return ptr;
  }

  double _api2wire_f64(double raw) {
    return raw;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_ZeroCopyBuffer_Uint8List(Uint8List raw) {
    return _api2wire_uint_8_list(raw);
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

  int _api2wire_u8(int raw) {
    return raw;
  }

  ffi.Pointer<wire_TreeNode> _api2wire_box_autoadd_tree_node(TreeNode raw) {
    final ptr = inner.new_box_autoadd_tree_node();
    _api_fill_to_wire_tree_node(raw, ptr.ref);
    return ptr;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_String(String raw) {
    return _api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  ffi.Pointer<wire_list_tree_node> _api2wire_list_tree_node(List<TreeNode> raw) {
    final ans = inner.new_list_tree_node(raw.length);
    for (var i = 0; i < raw.length; ++i) {
      _api_fill_to_wire_tree_node(raw[i], ans.ref.ptr[i]);
    }
    return ans;
  }

  ffi.Pointer<wire_list_size> _api2wire_list_size(List<Size> raw) {
    final ans = inner.new_list_size(raw.length);
    for (var i = 0; i < raw.length; ++i) {
      _api_fill_to_wire_size(raw[i], ans.ref.ptr[i]);
    }
    return ans;
  }

  // Section: api_fill_to_wire

  void _api_fill_to_wire_size(Size apiObj, wire_Size wireObj) {
    wireObj.width = _api2wire_i32(apiObj.width);
    wireObj.height = _api2wire_i32(apiObj.height);
  }

  void _api_fill_to_wire_point(Point apiObj, wire_Point wireObj) {
    wireObj.x = _api2wire_f64(apiObj.x);
    wireObj.y = _api2wire_f64(apiObj.y);
  }

  void _api_fill_to_wire_tree_node(TreeNode apiObj, wire_TreeNode wireObj) {
    wireObj.name = _api2wire_String(apiObj.name);
    wireObj.children = _api2wire_list_tree_node(apiObj.children);
  }
}

// Section: wire2api

Size _wire2api_size(dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 2) throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
  return Size(
    width: _wire2api_i32(arr[0]),
    height: _wire2api_i32(arr[1]),
  );
}

int _wire2api_i32(dynamic raw) {
  return raw as int;
}

Point _wire2api_point(dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 2) throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
  return Point(
    x: _wire2api_f64(arr[0]),
    y: _wire2api_f64(arr[1]),
  );
}

double _wire2api_f64(dynamic raw) {
  return raw as double;
}

Uint8List _wire2api_ZeroCopyBuffer_Uint8List(dynamic raw) {
  return raw as Uint8List;
}

Uint8List _wire2api_uint_8_list(dynamic raw) {
  return raw as Uint8List;
}

int _wire2api_u8(dynamic raw) {
  return raw as int;
}

TreeNode _wire2api_tree_node(dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 2) throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
  return TreeNode(
    name: _wire2api_String(arr[0]),
    children: _wire2api_list_tree_node(arr[1]),
  );
}

String _wire2api_String(dynamic raw) {
  return raw as String;
}

List<TreeNode> _wire2api_list_tree_node(dynamic raw) {
  return (raw as List<dynamic>).map((item) => _wire2api_tree_node(item)).toList();
}

List<Size> _wire2api_list_size(dynamic raw) {
  return (raw as List<dynamic>).map((item) => _wire2api_size(item)).toList();
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class FlutterRustBridgeExampleWire implements FlutterRustBridgeWireBase {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName) _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  FlutterRustBridgeExampleWire(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  FlutterRustBridgeExampleWire.fromLookup(ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName) lookup)
      : _lookup = lookup;

  void wire_draw_mandelbrot(
    int port,
    ffi.Pointer<wire_Size> image_size,
    ffi.Pointer<wire_Point> zoom_point,
    double scale,
    int num_threads,
  ) {
    return _wire_draw_mandelbrot(
      port,
      image_size,
      zoom_point,
      scale,
      num_threads,
    );
  }

  late final _wire_draw_mandelbrotPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_Size>, ffi.Pointer<wire_Point>, ffi.Double,
              ffi.Int32)>>('wire_draw_mandelbrot');
  late final _wire_draw_mandelbrot = _wire_draw_mandelbrotPtr
      .asFunction<void Function(int, ffi.Pointer<wire_Size>, ffi.Pointer<wire_Point>, double, int)>();

  void wire_passing_complex_structs(
    int port,
    ffi.Pointer<wire_TreeNode> root,
  ) {
    return _wire_passing_complex_structs(
      port,
      root,
    );
  }

  late final _wire_passing_complex_structsPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Pointer<wire_TreeNode>)>>(
          'wire_passing_complex_structs');
  late final _wire_passing_complex_structs =
      _wire_passing_complex_structsPtr.asFunction<void Function(int, ffi.Pointer<wire_TreeNode>)>();

  void wire_off_topic_memory_test_input_array(
    int port,
    ffi.Pointer<wire_uint_8_list> input,
  ) {
    return _wire_off_topic_memory_test_input_array(
      port,
      input,
    );
  }

  late final _wire_off_topic_memory_test_input_arrayPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>(
          'wire_off_topic_memory_test_input_array');
  late final _wire_off_topic_memory_test_input_array =
      _wire_off_topic_memory_test_input_arrayPtr.asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_off_topic_memory_test_output_zero_copy_buffer(
    int port,
    int len,
  ) {
    return _wire_off_topic_memory_test_output_zero_copy_buffer(
      port,
      len,
    );
  }

  late final _wire_off_topic_memory_test_output_zero_copy_bufferPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32)>>(
          'wire_off_topic_memory_test_output_zero_copy_buffer');
  late final _wire_off_topic_memory_test_output_zero_copy_buffer =
      _wire_off_topic_memory_test_output_zero_copy_bufferPtr.asFunction<void Function(int, int)>();

  void wire_off_topic_memory_test_output_vec_u8(
    int port,
    int len,
  ) {
    return _wire_off_topic_memory_test_output_vec_u8(
      port,
      len,
    );
  }

  late final _wire_off_topic_memory_test_output_vec_u8Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32)>>('wire_off_topic_memory_test_output_vec_u8');
  late final _wire_off_topic_memory_test_output_vec_u8 =
      _wire_off_topic_memory_test_output_vec_u8Ptr.asFunction<void Function(int, int)>();

  void wire_off_topic_memory_test_input_vec_of_object(
    int port,
    ffi.Pointer<wire_list_size> input,
  ) {
    return _wire_off_topic_memory_test_input_vec_of_object(
      port,
      input,
    );
  }

  late final _wire_off_topic_memory_test_input_vec_of_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Pointer<wire_list_size>)>>(
          'wire_off_topic_memory_test_input_vec_of_object');
  late final _wire_off_topic_memory_test_input_vec_of_object =
      _wire_off_topic_memory_test_input_vec_of_objectPtr.asFunction<void Function(int, ffi.Pointer<wire_list_size>)>();

  void wire_off_topic_memory_test_output_vec_of_object(
    int port,
    int len,
  ) {
    return _wire_off_topic_memory_test_output_vec_of_object(
      port,
      len,
    );
  }

  late final _wire_off_topic_memory_test_output_vec_of_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32)>>(
          'wire_off_topic_memory_test_output_vec_of_object');
  late final _wire_off_topic_memory_test_output_vec_of_object =
      _wire_off_topic_memory_test_output_vec_of_objectPtr.asFunction<void Function(int, int)>();

  void wire_off_topic_memory_test_input_complex_struct(
    int port,
    ffi.Pointer<wire_TreeNode> input,
  ) {
    return _wire_off_topic_memory_test_input_complex_struct(
      port,
      input,
    );
  }

  late final _wire_off_topic_memory_test_input_complex_structPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Pointer<wire_TreeNode>)>>(
          'wire_off_topic_memory_test_input_complex_struct');
  late final _wire_off_topic_memory_test_input_complex_struct =
      _wire_off_topic_memory_test_input_complex_structPtr.asFunction<void Function(int, ffi.Pointer<wire_TreeNode>)>();

  void wire_off_topic_memory_test_output_complex_struct(
    int port,
    int len,
  ) {
    return _wire_off_topic_memory_test_output_complex_struct(
      port,
      len,
    );
  }

  late final _wire_off_topic_memory_test_output_complex_structPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32)>>(
          'wire_off_topic_memory_test_output_complex_struct');
  late final _wire_off_topic_memory_test_output_complex_struct =
      _wire_off_topic_memory_test_output_complex_structPtr.asFunction<void Function(int, int)>();

  ffi.Pointer<wire_Size> new_box_autoadd_size() {
    return _new_box_autoadd_size();
  }

  late final _new_box_autoadd_sizePtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_Size> Function()>>('new_box_autoadd_size');
  late final _new_box_autoadd_size = _new_box_autoadd_sizePtr.asFunction<ffi.Pointer<wire_Size> Function()>();

  ffi.Pointer<wire_Point> new_box_autoadd_point() {
    return _new_box_autoadd_point();
  }

  late final _new_box_autoadd_pointPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_Point> Function()>>('new_box_autoadd_point');
  late final _new_box_autoadd_point = _new_box_autoadd_pointPtr.asFunction<ffi.Pointer<wire_Point> Function()>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list(
    int len,
  ) {
    return _new_uint_8_list(
      len,
    );
  }

  late final _new_uint_8_listPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_uint_8_list> Function(ffi.Int32)>>('new_uint_8_list');
  late final _new_uint_8_list = _new_uint_8_listPtr.asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  ffi.Pointer<wire_TreeNode> new_box_autoadd_tree_node() {
    return _new_box_autoadd_tree_node();
  }

  late final _new_box_autoadd_tree_nodePtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_TreeNode> Function()>>('new_box_autoadd_tree_node');
  late final _new_box_autoadd_tree_node =
      _new_box_autoadd_tree_nodePtr.asFunction<ffi.Pointer<wire_TreeNode> Function()>();

  ffi.Pointer<wire_list_tree_node> new_list_tree_node(
    int len,
  ) {
    return _new_list_tree_node(
      len,
    );
  }

  late final _new_list_tree_nodePtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_list_tree_node> Function(ffi.Int32)>>('new_list_tree_node');
  late final _new_list_tree_node = _new_list_tree_nodePtr.asFunction<ffi.Pointer<wire_list_tree_node> Function(int)>();

  ffi.Pointer<wire_list_size> new_list_size(
    int len,
  ) {
    return _new_list_size(
      len,
    );
  }

  late final _new_list_sizePtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_list_size> Function(ffi.Int32)>>('new_list_size');
  late final _new_list_size = _new_list_sizePtr.asFunction<ffi.Pointer<wire_list_size> Function(int)>();

  void rust_dummy_method_to_enforce_bundling() {
    return _rust_dummy_method_to_enforce_bundling();
  }

  late final _rust_dummy_method_to_enforce_bundlingPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('rust_dummy_method_to_enforce_bundling');
  late final _rust_dummy_method_to_enforce_bundling =
      _rust_dummy_method_to_enforce_bundlingPtr.asFunction<void Function()>();

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>('store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr.asFunction<void Function(DartPostCObjectFnType)>();
}

class wire_Size extends ffi.Struct {
  @ffi.Int32()
  external int width;

  @ffi.Int32()
  external int height;
}

class wire_Point extends ffi.Struct {
  @ffi.Double()
  external double x;

  @ffi.Double()
  external double y;
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

class wire_list_tree_node extends ffi.Struct {
  external ffi.Pointer<wire_TreeNode> ptr;

  @ffi.Int32()
  external int len;
}

class wire_TreeNode extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> name;

  external ffi.Pointer<wire_list_tree_node> children;
}

class wire_list_size extends ffi.Struct {
  external ffi.Pointer<wire_Size> ptr;

  @ffi.Int32()
  external int len;
}

typedef DartPostCObjectFnType = ffi.Pointer<ffi.NativeFunction<ffi.Uint8 Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
