// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.31.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'pseudo_manual/stream_twin_rust_async.dart';

Future<Stream<String>> funcStreamReturnErrorTwinNormal({dynamic hint}) =>
    RustLib.instance.api.funcStreamReturnErrorTwinNormal(hint: hint);

Future<Stream<String>> funcStreamReturnPanicTwinNormal({dynamic hint}) =>
    RustLib.instance.api.funcStreamReturnPanicTwinNormal(hint: hint);

Future<Stream<int>> funcStreamSinkArgPositionTwinNormal(
        {required int a, required int b, dynamic hint}) =>
    RustLib.instance.api
        .funcStreamSinkArgPositionTwinNormal(a: a, b: b, hint: hint);

Future<Stream<MyStreamEntryTwinNormal>> handleStreamOfStructTwinNormal(
        {dynamic hint}) =>
    RustLib.instance.api.handleStreamOfStructTwinNormal(hint: hint);

Future<Stream<LogTwinNormal>> handleStreamSinkAt1TwinNormal(
        {required int key, required int max, dynamic hint}) =>
    RustLib.instance.api
        .handleStreamSinkAt1TwinNormal(key: key, max: max, hint: hint);

Future<Stream<LogTwinNormal>> handleStreamSinkAt2TwinNormal(
        {required int key, required int max, dynamic hint}) =>
    RustLib.instance.api
        .handleStreamSinkAt2TwinNormal(key: key, max: max, hint: hint);

Future<Stream<LogTwinNormal>> handleStreamSinkAt3TwinNormal(
        {required int key, required int max, dynamic hint}) =>
    RustLib.instance.api
        .handleStreamSinkAt3TwinNormal(key: key, max: max, hint: hint);

Future<Stream<U8Array2>> streamSinkFixedSizedPrimitiveArrayTwinNormal(
        {dynamic hint}) =>
    RustLib.instance.api
        .streamSinkFixedSizedPrimitiveArrayTwinNormal(hint: hint);

Future<void> streamSinkInsideVecTwinNormal(
        {required List<RustStreamSink<int>> arg, dynamic hint}) =>
    RustLib.instance.api.streamSinkInsideVecTwinNormal(arg: arg, hint: hint);

Future<void> streamSinkInsideStructTwinNormal(
        {required MyStructContainingStreamSinkTwinNormal arg, dynamic hint}) =>
    RustLib.instance.api.streamSinkInsideStructTwinNormal(arg: arg, hint: hint);

class LogTwinNormal {
  final int key;
  final int value;

  const LogTwinNormal({
    required this.key,
    required this.value,
  });

  @override
  int get hashCode => key.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogTwinNormal &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value;
}

class MyStreamEntryTwinNormal {
  final String hello;

  const MyStreamEntryTwinNormal({
    required this.hello,
  });

  @override
  int get hashCode => hello.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyStreamEntryTwinNormal &&
          runtimeType == other.runtimeType &&
          hello == other.hello;
}

class MyStructContainingStreamSinkTwinNormal {
  final int a;
  final RustStreamSink<int> b;

  const MyStructContainingStreamSinkTwinNormal({
    required this.a,
    required this.b,
  });

  @override
  int get hashCode => a.hashCode ^ b.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyStructContainingStreamSinkTwinNormal &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b;
}
