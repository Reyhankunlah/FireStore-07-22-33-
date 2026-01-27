import 'package:flutter/material.dart';
import 'package:tugas1_11pplg2/Components/custom_color.dart';
import 'package:tugas1_11pplg2/Components/custom_button.dart';

class CustomEmptyState extends StatelessWidget {
  final String message;
  final String? subtitle;
  final IconData icon;
  final VoidCallback? onActionPressed;
  final String? actionLabel;

  const CustomEmptyState({
    super.key,
    required this.message,
    this.subtitle,
    this.icon = Icons.inbox_outlined,
    this.onActionPressed,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: CustomColor.textSecondary.withOpacity(0.5),
            ),
            
            const SizedBox(height: 24),

            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CustomColor.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 14,
                  color: CustomColor.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            if (onActionPressed != null && actionLabel != null) ...[
              const SizedBox(height: 24),
              CustomButton(
                myText: actionLabel!,
                onPressed: onActionPressed!,
                backgroundColor: CustomColor.primary,
                myTextColor: CustomColor.textWhite,
                icon: Icons.add,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}