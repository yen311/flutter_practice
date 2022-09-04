import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/randomizer_page.dart';
import 'package:flutter_basic/range_selector_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RangeSelectorPage extends HookWidget {
  final formKey = GlobalKey<FormState>();
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Range"),
      ),
      body: RangeSelectForm(
        formKey: formKey,
        minValueSetter: (value) {
          min.value = value;
        },
        maxValueSetter: (value) {
          max.value = value;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return RandomizerPage(
                    max: max.value,
                    min: min.value,
                  );
                },
              ),
            );
          }
        },
        child: const Icon(
          Icons.forward,
        ),
      ),
    );
  }
}
