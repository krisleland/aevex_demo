import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? textInputType;

  const InputWidget(
      {Key? key,
      required this.label,
      required this.controller,
      this.textInputAction = TextInputAction.next,
      this.onFieldSubmitted,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
