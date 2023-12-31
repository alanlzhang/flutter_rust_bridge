// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.9.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

HideData? syncOptionRustOpaqueTwinSse({dynamic hint}) =>
    RustLib.instance.api.syncOptionRustOpaqueTwinSse(hint: hint);

HideData syncCreateOpaqueTwinSse({dynamic hint}) =>
    RustLib.instance.api.syncCreateOpaqueTwinSse(hint: hint);

NonSendHideData syncCreateSyncOpaqueTwinSse({dynamic hint}) =>
    RustLib.instance.api.syncCreateSyncOpaqueTwinSse(hint: hint);

NonCloneData syncCreateNonCloneTwinSse({dynamic hint}) =>
    RustLib.instance.api.syncCreateNonCloneTwinSse(hint: hint);

String syncRunOpaqueTwinSse({required NonSendHideData opaque, dynamic hint}) =>
    RustLib.instance.api.syncRunOpaqueTwinSse(opaque: opaque, hint: hint);

/// Structure for testing the sync-mode RustOpaque code generator.
/// FrbOpaqueSyncReturn must be only return type.
/// FrbOpaqueSyncReturn must be without wrapper like Option<> Vec<> etc.
FrbOpaqueSyncReturn frbSyncGeneratorTestTwinSse({dynamic hint}) =>
    RustLib.instance.api.frbSyncGeneratorTestTwinSse(hint: hint);

// Rust type: flutter_rust_bridge::RustOpaque<crate::auxiliary::sample_types::FrbOpaqueSyncReturn>
@sealed
class FrbOpaqueSyncReturn extends RustOpaque {
  FrbOpaqueSyncReturn.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  FrbOpaqueSyncReturn.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_FrbOpaqueSyncReturn,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_FrbOpaqueSyncReturn,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_FrbOpaqueSyncReturnPtr,
  );
}

// Rust type: flutter_rust_bridge::RustOpaque<crate::auxiliary::sample_types::HideData>
@sealed
class HideData extends RustOpaque {
  HideData.dcoDecode(List<dynamic> wire) : super.dcoDecode(wire, _kStaticData);

  HideData.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_HideData,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_HideData,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_HideDataPtr,
  );
}

// Rust type: flutter_rust_bridge::RustOpaque<crate::auxiliary::sample_types::NonCloneData>
@sealed
class NonCloneData extends RustOpaque {
  NonCloneData.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  NonCloneData.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_NonCloneData,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_NonCloneData,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_NonCloneDataPtr,
  );
}

// Rust type: flutter_rust_bridge::RustOpaque<crate::auxiliary::sample_types::NonSendHideData>
@sealed
class NonSendHideData extends RustOpaque {
  NonSendHideData.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  NonSendHideData.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_NonSendHideData,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_NonSendHideData,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_NonSendHideDataPtr,
  );
}
