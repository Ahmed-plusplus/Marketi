import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_themes.dart';

import 'custom_indicator.dart';

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
      onPressed: isLoading == true ? onPressed : null,
      child: (isLoading ?? false) ? CustomIndicator()
          : Text(text, style: style ?? textElevatedButtonStyle,),
    );
  }
}
