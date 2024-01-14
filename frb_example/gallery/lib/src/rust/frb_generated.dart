// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.19.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'api/mandelbrot.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.io.dart' if (dart.library.html) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {}

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'rust_lib',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  Future<Uint8List> drawMandelbrot(
      {required Size imageSize,
      required Point zoomPoint,
      required double scale,
      required int numThreads,
      dynamic hint});
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<Uint8List> drawMandelbrot(
      {required Size imageSize,
      required Point zoomPoint,
      required double scale,
      required int numThreads,
      dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        var arg0 = cst_encode_box_autoadd_size(imageSize);
        var arg1 = cst_encode_box_autoadd_point(zoomPoint);
        var arg2 = cst_encode_f_64(scale);
        var arg3 = cst_encode_i_32(numThreads);
        return wire.wire_draw_mandelbrot(port_, arg0, arg1, arg2, arg3);
      },
      codec: DcoCodec(
        decodeSuccessData: dco_decode_list_prim_u_8_strict,
        decodeErrorData: dco_decode_AnyhowException,
      ),
      constMeta: kDrawMandelbrotConstMeta,
      argValues: [imageSize, zoomPoint, scale, numThreads],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kDrawMandelbrotConstMeta => const TaskConstMeta(
        debugName: "draw_mandelbrot",
        argNames: ["imageSize", "zoomPoint", "scale", "numThreads"],
      );

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw) {
    return AnyhowException(raw as String);
  }

  @protected
  String dco_decode_String(dynamic raw) {
    return raw as String;
  }

  @protected
  Point dco_decode_box_autoadd_point(dynamic raw) {
    return dco_decode_point(raw);
  }

  @protected
  Size dco_decode_box_autoadd_size(dynamic raw) {
    return dco_decode_size(raw);
  }

  @protected
  double dco_decode_f_64(dynamic raw) {
    return raw as double;
  }

  @protected
  int dco_decode_i_32(dynamic raw) {
    return raw as int;
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    return raw as Uint8List;
  }

  @protected
  Point dco_decode_point(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Point(
      x: dco_decode_f_64(arr[0]),
      y: dco_decode_f_64(arr[1]),
    );
  }

  @protected
  Size dco_decode_size(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Size(
      width: dco_decode_i_32(arr[0]),
      height: dco_decode_i_32(arr[1]),
    );
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    return raw as int;
  }

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer) {
    var inner = sse_decode_String(deserializer);
    return AnyhowException(inner);
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  Point sse_decode_box_autoadd_point(SseDeserializer deserializer) {
    return (sse_decode_point(deserializer));
  }

  @protected
  Size sse_decode_box_autoadd_size(SseDeserializer deserializer) {
    return (sse_decode_size(deserializer));
  }

  @protected
  double sse_decode_f_64(SseDeserializer deserializer) {
    return deserializer.buffer.getFloat64();
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    return deserializer.buffer.getInt32();
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  Point sse_decode_point(SseDeserializer deserializer) {
    var var_x = sse_decode_f_64(deserializer);
    var var_y = sse_decode_f_64(deserializer);
    return Point(x: var_x, y: var_y);
  }

  @protected
  Size sse_decode_size(SseDeserializer deserializer) {
    var var_width = sse_decode_i_32(deserializer);
    var var_height = sse_decode_i_32(deserializer);
    return Size(width: var_width, height: var_height);
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    return deserializer.buffer.getUint8();
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  double cst_encode_f_64(double raw) {
    return raw;
  }

  @protected
  int cst_encode_i_32(int raw) {
    return raw;
  }

  @protected
  int cst_encode_u_8(int raw) {
    return raw;
  }

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer) {
    throw UnimplementedError(
        'not yet supported in serialized mode, feel free to create an issue');
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_box_autoadd_point(Point self, SseSerializer serializer) {
    sse_encode_point(self, serializer);
  }

  @protected
  void sse_encode_box_autoadd_size(Size self, SseSerializer serializer) {
    sse_encode_size(self, serializer);
  }

  @protected
  void sse_encode_f_64(double self, SseSerializer serializer) {
    serializer.buffer.putFloat64(self);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    serializer.buffer.putInt32(self);
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_point(Point self, SseSerializer serializer) {
    sse_encode_f_64(self.x, serializer);
    sse_encode_f_64(self.y, serializer);
  }

  @protected
  void sse_encode_size(Size self, SseSerializer serializer) {
    sse_encode_i_32(self.width, serializer);
    sse_encode_i_32(self.height, serializer);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    serializer.buffer.putUint8(self ? 1 : 0);
  }
}
