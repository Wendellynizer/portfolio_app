import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController controller;

  const CustomTextField({super.key, required this.hintText, required this.maxLines, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: hintText,
        filled: true,
        fillColor: Colors.white,
        alignLabelWithHint: true
      ),
    );
  }
}

class CustomPassField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomPassField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,

      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hintText,
          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true
      ),
    );
  }
}
