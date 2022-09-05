import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/randomizer_page.dart';
import 'package:flutter_basic/range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Range"),
      ),
      body: RangeSelectForm(
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return RandomizerPage();
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
