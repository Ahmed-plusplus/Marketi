import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_themes.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: Text(text, style: textOutlinedButtonStyle,));
  }
}
