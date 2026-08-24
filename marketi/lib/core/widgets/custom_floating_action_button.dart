import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {

  const CustomFloatingActionButton({super.key, required this.icon, required this.onPressed, this.iconColor});

  final IconData icon;
  final Color? iconColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(icon, color: iconColor ?? AppColors.primary,),);
  }
}
