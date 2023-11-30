import 'dart:typed_data';

import 'package:frb_example_pure_dart/src/rust/api/misc_example.dart';
import 'package:frb_example_pure_dart/src/rust/auxiliary/sample_types.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

Future<void> main({bool skipRustLibInit = false}) async {
  if (!skipRustLibInit) await RustLib.init();

  void testComplexStruct(MyTreeNodeTwinNormal complexStructResp,
      {required int arrLen}) {
    expect(complexStructResp.valueI32, 100);
    expect(complexStructResp.valueVecU8, List.filled(arrLen, 100));
    expect(complexStructResp.children[0].valueVecU8, List.filled(arrLen, 110));
    expect(complexStructResp.children[0].children[0].valueVecU8,
        List.filled(arrLen, 111));
    expect(complexStructResp.children[1].valueVecU8, List.filled(arrLen, 120));
  }

  test('dart call handleComplexStruct', () async {
    final arrLen = 5;
    final complexStructResp = await handleComplexStructTwinNormal(
        s: _createMyTreeNode(arrLen: arrLen));
    testComplexStruct(complexStructResp, arrLen: arrLen);
  });

  test('loop and call many times', () async {
    var obj = _createMyTreeNode(arrLen: 5);
    for (var i = 0; i < 500; ++i) {
      obj = await handleComplexStructTwinNormal(s: obj);
    }
  });

  test("dart call list_of_primitive_enums", () async {
    List<WeekdaysTwinNormal> days = await listOfPrimitiveEnumsTwinNormal(
        weekdays: WeekdaysTwinNormal.values);
    expect(days, WeekdaysTwinNormal.values);
  });

  test('dart call handleNestedStruct', () async {
    final r = await handleNestedStructTwinNormal(s: _createMyNestedStruct());
    testComplexStruct(r.treeNode, arrLen: 5);
    expect(r.weekday, WeekdaysTwinNormal.friday);
  });

  test('Lossless big buffers', () async {
    final list = await handleBigBuffersTwinNormal();
    expect(list.int64[0], BigInt.parse('-9223372036854775808'));
    expect(list.int64[1], BigInt.parse('9223372036854775807'));
    expect(list.uint64[0], BigInt.parse('0xFFFFFFFFFFFFFFFF'),
        reason: 'uint64');
  });

  test('test abc', () async {
    final output1 = await testAbcEnumTwinNormal(
        abc: AbcTwinNormal.a(ATwinNormal(a: "test")));
    expect((output1 as AbcTwinNormal_A).field0.a, "test");

    final output2 =
        await testAbcEnumTwinNormal(abc: AbcTwinNormal.b(BTwinNormal(b: 1)));
    expect((output2 as AbcTwinNormal_B).field0.b, 1);

    final output3 = await testAbcEnumTwinNormal(
        abc: AbcTwinNormal.c(CTwinNormal(c: false)));
    expect((output3 as AbcTwinNormal_C).field0.c, false);

    final output4 = await testAbcEnumTwinNormal(abc: AbcTwinNormal.justInt(1));
    expect((output4 as AbcTwinNormal_JustInt).field0, 1);
  });

  test("dart call struct_with_enum_member", () async {
    final result = await testStructWithEnumTwinNormal(
        se: StructWithEnumTwinNormal(
            abc1: AbcTwinNormal.a(ATwinNormal(a: "aaa")),
            abc2: AbcTwinNormal.b(BTwinNormal(b: 999))));
    expect(result.abc1.whenOrNull(b: (BTwinNormal b) => b.b), 999);
    expect(result.abc2.whenOrNull(a: (ATwinNormal a) => a.a), "aaa");
  });

  test('dart call handleString', () async {
    expect(await handleStringTwinNormal(s: "Hello, world!"),
        "Hello, world!Hello, world!");
  });
  test('dart call handleString with nul-containing string', () async {
    expect(await handleStringTwinNormal(s: "Hello\u0000world!"),
        kIsWeb ? "Hello\u0000world!Hello\u0000world!" : "");
  });

  // TODO rm?
  // test('dart call handleStringSync', () {
  //   expect(handleStringSync(s: "Hello, world!"), "Hello, world!Hello, world!");
  // });
  // test('dart call handleStringSync with nul-containing string', () {
  //   expect(handleStringSync(s: "Hello\u0000world!"), kIsWeb ? "Hello\u0000world!Hello\u0000world!" : "");
  // });

  test('dart call handleVecU8', () async {
    final len = 100000;
    expect(
        await handleVecU8TwinNormal(
            v: Uint8List.fromList(List.filled(len, 127))),
        Uint8List.fromList(List.filled(len * 2, 127)));
  });

  // TODO rm?
  // test('dart call handleVecU8Sync', () {
  //   final len = 100000;
  //   expect(
  //       handleVecU8Sync(v: Uint8List.fromList(List.filled(len, 127))), Uint8List.fromList(List.filled(len * 2, 127)));
  // });

  test('dart call handleStruct', () async {
    final structResp = await handleStructTwinNormal(
        arg: MySize(width: 42, height: 100),
        boxed: MySize(width: 1000, height: 10000));
    expect(structResp.width, 42 + 1000);
    expect(structResp.height, 100 + 10000);
  });

  // TODO rm?
  // test('dart call handleStructSync', () {
  //   final structResp = handleStructSync(arg: MySize(width: 42, height: 100), boxed: MySize(width: 1000, height: 10000));
  //   expect(structResp.width, 42 + 1000);
  //   expect(structResp.height, 100 + 10000);
  // });

  // TODO rm?
  // test('dart call handleStructSyncFreezed', () {
  //   final structResp = handleStructSyncFreezedTwinNormal(
  //       arg: MySizeFreezedTwinNormal(width: 42, height: 100),
  //       boxed: MySizeFreezedTwinNormal(width: 1000, height: 10000));
  //   expect(structResp.width, 42 + 1000);
  //   expect(structResp.height, 100 + 10000);
  //   // Only freezed classes have copyWith
  //   expect(structResp.copyWith, isNotNull);
  // });

  // TODO rm?
  // test('dart call handleComplexStructSync', () {
  //   final arrLen = 5;
  //   final complexStructResp = handleComplexStructSync(s: _createMyTreeNode(arrLen: arrLen));
  //   expect(complexStructResp.valueI32, 100);
  //   expect(complexStructResp.valueVecU8, List.filled(arrLen, 100));
  //   expect(complexStructResp.children[0].valueVecU8, List.filled(arrLen, 110));
  //   expect(complexStructResp.children[0].children[0].valueVecU8, List.filled(arrLen, 111));
  //   expect(complexStructResp.children[1].valueVecU8, List.filled(arrLen, 120));
  // });
}

MyTreeNodeTwinNormal _createMyTreeNode({required int arrLen}) {
  return MyTreeNodeTwinNormal(
    valueI32: 100,
    valueVecU8: Uint8List.fromList(List.filled(arrLen, 100)),
    valueBoolean: true,
    children: [
      MyTreeNodeTwinNormal(
        valueI32: 110,
        valueVecU8: Uint8List.fromList(List.filled(arrLen, 110)),
        valueBoolean: true,
        children: [
          MyTreeNodeTwinNormal(
            valueI32: 111,
            valueVecU8: Uint8List.fromList(List.filled(arrLen, 111)),
            valueBoolean: true,
            children: [],
          ),
        ],
      ),
      MyTreeNodeTwinNormal(
        valueI32: 120,
        valueVecU8: Uint8List.fromList(List.filled(arrLen, 120)),
        valueBoolean: true,
        children: [],
      ),
    ],
  );
}

MyNestedStructTwinNormal _createMyNestedStruct() {
  return MyNestedStructTwinNormal(
      treeNode: _createMyTreeNode(arrLen: 5),
      weekday: WeekdaysTwinNormal.friday);
}
