import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basic/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomizerPage extends ConsumerWidget {
  RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Randomizer"),
      ),
      body: Center(
        child: Text(
          randomizer.generatedNumber?.toString() ?? "Generate a Number",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        onPressed: () {
          ref.read(randomizerProvider.notifier).generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
