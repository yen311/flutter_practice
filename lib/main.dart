import 'package:flutter/material.dart';
import 'package:flutter_basic/randomizer_change_notifier.dart';
import 'package:flutter_basic/randomizer_state_notifier.dart';
import 'package:flutter_basic/range_selector_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

final randomizerProvider = StateNotifierProvider<RandomizerStateNotifier, RandomizerState>((ref) => RandomizerStateNotifier());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Randomizer',
        debugShowCheckedModeBanner: false,
        home: RangeSelectorPage(),
      ),
    );
  }
}
