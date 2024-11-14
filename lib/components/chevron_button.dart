import "package:flutter/material.dart";

class ChevronButton extends StatelessWidget {
  final String direction;
  final VoidCallback onPress;
  
  const ChevronButton({super.key, required this.direction, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const CircleBorder(),
      onPressed: onPress,
      child: Icon(
        (direction == "up") ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
        size: 60,
      ),
    );
  }
}
