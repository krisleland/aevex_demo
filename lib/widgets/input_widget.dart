import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputWidget({Key? key, required this.label, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
