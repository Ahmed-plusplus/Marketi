import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return (labelText == null) ? createTextField()
    : Column(
      children: [
        Text(labelText!),
        createTextField(),
      ],
    );
  }

  Widget createTextField() => TextField(
    decoration: InputDecoration(
      contentPadding: EdgeInsetsGeometry.all(14),
      suffixIcon: Padding(
        padding: const EdgeInsets.all(14.0),
        child: suffixIcon != null ? Container(
          width: 16,
          height: 16,
          child: suffixIcon,
        ): suffixIcon,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(14.0),
        child: prefixIcon,
      ),
      hint: Text(hintText ?? '', ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightBlue700.withAlpha(180))
      ),
    ),
    onChanged: onChanged,
    onSubmitted: onFieldSubmitted,
    obscureText: obscureText ?? false,
  );
}
