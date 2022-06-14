import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor, backgroundColor;
  final double size;
  final double iconSize;
  const AppIcon(
      {Key? key,
      this.backgroundColor = const Color(0xFFFcf4e4),
      this.iconColor = const Color(0xFF756d54),
      required this.icon,
      this.size = 40,
      this.iconSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: iconColor, size: iconSize),
    );
  }
}
