import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData? icon;
  late Function()? onPress;
  final double iconSize;

  CircleButton({
    this.icon,
    this.onPress,
    this.iconSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration:
          BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
      ),
    );
  }
}
