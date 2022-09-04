import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int min, max;
  RandomizerPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);

    final randomGenerator = Random();
    return Scaffold(
      appBar: AppBar(
        title: Text("Randomizer"),
      ),
      body: Center(
        child: Text(
          generatedNumber.value?.toString() ?? "Generate a Number",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        onPressed: () {
          generatedNumber.value = min + randomGenerator.nextInt(max + 1 - min);
          ;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
