import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_themes.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, required this.onPressed, this.style});

  final String text;
  final Function() onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text, style: style ?? textElevatedButtonStyle,),);
  }
}
