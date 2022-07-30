import 'package:flutter/material.dart';
import 'package:flutter_form/utils.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTest extends StatefulWidget {
  const FormTest({Key? key}) : super(key: key);

  @override
  State<FormTest> createState() => _FormTestState();
}

class _FormTestState extends State<FormTest> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'age',
              decoration: const InputDecoration(
                labelText:
                    'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
              ),
              onChanged: _onChanged,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      )
    ]);
  }

  void _onChanged(String? value) {
    printDebug(value ?? '');
  }
}
