import "package:flutter/material.dart";
import "package:portfolio_app/util/util.dart";

class CustomButton extends StatelessWidget {

  final Widget content;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.onPressed, required this.content});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: primaryColor,
      minWidth: double.infinity,
      child: content,
    );
  }
}


