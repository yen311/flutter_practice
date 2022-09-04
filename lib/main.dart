import 'package:flutter/material.dart';
import 'package:flutter_basic/range_selector_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomizer',
      debugShowCheckedModeBanner: false,
      home: RangeSelectorPage(),
    );
  }
}
