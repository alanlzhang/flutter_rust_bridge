import 'package:flutter/material.dart';
import 'package:flutter_via_integrate/src/rust/api/simple.dart';
import 'package:flutter_via_integrate/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: Center(
          child: Text('1 + 2 = ${add(left: 1, right: 2)}'),
        ),
      ),
    );
  }
}
