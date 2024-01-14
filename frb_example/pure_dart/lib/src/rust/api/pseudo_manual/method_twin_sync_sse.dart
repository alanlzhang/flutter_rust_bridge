// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.19.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:collection/collection.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

SumWithTwinSyncSse getSumStructTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.getSumStructTwinSyncSse(hint: hint);

SumWithTwinSyncSseArray3 getSumArrayTwinSyncSse(
        {required int a, required int b, required int c, dynamic hint}) =>
    RustLib.instance.api.getSumArrayTwinSyncSse(a: a, b: b, c: c, hint: hint);

class ConcatenateWithTwinSyncSse {
  final String a;

  const ConcatenateWithTwinSyncSse({
    required this.a,
  });

  static String concatenateStaticTwinSyncSse(
          {required String a, required String b, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinSyncSseConcatenateStaticTwinSyncSse(
              a: a, b: b, hint: hint);

  String concatenateTwinSyncSse({required String b, dynamic hint}) =>
      RustLib.instance.api.concatenateWithTwinSyncSseConcatenateTwinSyncSse(
        that: this,
        b: b,
      );

  static Stream<int> handleSomeStaticStreamSinkSingleArgTwinSyncSse(
          {dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinSyncSseHandleSomeStaticStreamSinkSingleArgTwinSyncSse(
              hint: hint);

  static Stream<Log2TwinSyncSse> handleSomeStaticStreamSinkTwinSyncSse(
          {required int key, required int max, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinSyncSseHandleSomeStaticStreamSinkTwinSyncSse(
              key: key, max: max, hint: hint);

  Stream<int> handleSomeStreamSinkAt1TwinSyncSse({dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinSyncSseHandleSomeStreamSinkAt1TwinSyncSse(
        that: this,
      );

  Stream<Log2TwinSyncSse> handleSomeStreamSinkTwinSyncSse(
          {required int key, required int max, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinSyncSseHandleSomeStreamSinkTwinSyncSse(
        that: this,
        key: key,
        max: max,
      );

  static ConcatenateWithTwinSyncSse newTwinSyncSse(
          {required String a, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinSyncSseNewTwinSyncSse(a: a, hint: hint);

  String get simpleGetterTwinSyncSse =>
      RustLib.instance.api.concatenateWithTwinSyncSseSimpleGetterTwinSyncSse(
        that: this,
      );

  @override
  int get hashCode => a.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConcatenateWithTwinSyncSse &&
          runtimeType == other.runtimeType &&
          a == other.a;
}

class Log2TwinSyncSse {
  final int key;
  final String value;

  const Log2TwinSyncSse({
    required this.key,
    required this.value,
  });

  @override
  int get hashCode => key.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Log2TwinSyncSse &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value;
}

class SumWithTwinSyncSse {
  final int x;

  const SumWithTwinSyncSse({
    required this.x,
  });

  int sumTwinSyncSse({required int y, required int z, dynamic hint}) =>
      RustLib.instance.api.sumWithTwinSyncSseSumTwinSyncSse(
        that: this,
        y: y,
        z: z,
      );

  @override
  int get hashCode => x.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SumWithTwinSyncSse &&
          runtimeType == other.runtimeType &&
          x == other.x;
}

class SumWithTwinSyncSseArray3 extends NonGrowableListView<SumWithTwinSyncSse> {
  static const arraySize = 3;

  @internal
  List<SumWithTwinSyncSse> get inner => _inner;
  final List<SumWithTwinSyncSse> _inner;

  SumWithTwinSyncSseArray3(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  SumWithTwinSyncSseArray3.init(SumWithTwinSyncSse fill)
      : this(List<SumWithTwinSyncSse>.filled(arraySize, fill));
}
