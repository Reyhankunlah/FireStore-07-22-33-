import 'package:flutter/material.dart';

class CustomRoundedHeader extends StatelessWidget {
  final Color color;
  final double height;
  final double borderRadius;

  const CustomRoundedHeader({
    super.key,
    required this.color,
    this.height = 20,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
    );
  }
}