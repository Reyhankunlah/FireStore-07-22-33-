import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas1_11pplg2/Components/custom_color.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputType;
  final bool isNumber;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? Function(String?)? validator;
  final int maxLines;

  const CustomInput({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.isNumber = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 4),
            child: Text(
              label,
              style: const TextStyle(
                color: CustomColor.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: inputType,
          maxLines: maxLines,
          validator: validator,
          inputFormatters: isNumber
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          style: const TextStyle(
            color: CustomColor.textPrimary,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: hintText ?? label,
            hintStyle: const TextStyle(
              color: CustomColor.elementInactive2,
              fontSize: 14,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: CustomColor.primary,
                    size: 22,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: CustomColor.textSecondary),
                    onPressed: onSuffixIconPressed,
                  )
                : null,
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: CustomColor.elementInactive2,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: CustomColor.elementInactive2,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: CustomColor.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: CustomColor.error,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: CustomColor.error,
                width: 2,
              ),
            ),
            
            filled: true,
            fillColor: CustomColor.white,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),

            isDense: true,
          ),
        ),
        
        const SizedBox(height: 16), 
      ],
    );
  }
}