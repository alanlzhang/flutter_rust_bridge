import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

Future<void> main() async {
  await RustLib.init();

  test('drop', () async {
    print('hi dorptest 1');
    Uint8List? strongRef = Uint8List(1000000 * 300);
    // Uint8List? strongRef = Uint8List(1000000 * 1);
    // Uint8List? strongRef = Uint8List(10000);
    print('hi dorptest 2');
    final weakRef = WeakReference(strongRef);
    print('hi dorptest 3');
    (RustLib.instance.api as RustLibApiImpl)
        .generalizedFrbRustBinding
        .dartNewPersistentHandle(strongRef);
    print('hi dorptest 11');
    expect(weakRef.target, isNull);
    print('hi dorptest 12');
  });
}
