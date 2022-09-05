import 'package:flutter/material.dart';
import 'package:flutter_basic/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectForm extends ConsumerWidget {
  const RangeSelectForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: "minimum",
              intValueSetter: (value) => ref.read(randomizerProvider.notifier).setMin(value),
            ),
            const SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              labelText: "maximum",
              intValueSetter: (value) => ref.read(randomizerProvider.notifier).setMax(value),
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == "") {
          return "This must be filled";
        } else if (int.tryParse(value!) == null) {
          return "This must be an integer";
        }
        return null;
      },
      onSaved: (newValue) {
        intValueSetter(int.parse(newValue ?? ""));
      },
    );
  }
}
