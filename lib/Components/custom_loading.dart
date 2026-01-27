import 'package:flutter/material.dart';
import 'package:tugas1_11pplg2/Components/custom_color.dart';

class CustomLoading extends StatelessWidget {
  final String? message;
  final Color? color;

  const CustomLoading({
    super.key,
    this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: color ?? CustomColor.primary,
            strokeWidth: 3,
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: const TextStyle(
                color: CustomColor.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}