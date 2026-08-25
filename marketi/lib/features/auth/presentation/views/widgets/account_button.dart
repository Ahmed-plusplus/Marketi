import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: BoxBorder.all(color: AppColors.lightBlue700.withAlpha(180), width: 1),
      ),
      child: icon,
    );
  }
}
