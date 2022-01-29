import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;

  const InputWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
