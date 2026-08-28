import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_themes.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
    this.isLoading
  });

  final String text;
  final Function() onPressed;
  final TextStyle? style;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading == true ? null : onPressed,
      child: (isLoading ?? false) ? const CircularProgressIndicator(color: Colors.white,)
          : Text(text, style: style ?? textElevatedButtonStyle,),
    );
  }
}
