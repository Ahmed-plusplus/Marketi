import 'package:flutter/material.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/generated/assets.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => customBackNavigation(context),
      child: Container(
        decoration: ShapeDecoration(shape: CircleBorder(side: BorderSide(color: AppColors.lightBlue700.withAlpha(180)))),
        child: Assets.images.backIcon.svg(),
      ),
    );
  }
}
