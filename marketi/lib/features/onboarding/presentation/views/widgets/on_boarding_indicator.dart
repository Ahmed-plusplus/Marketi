import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ScrollingDotsEffect(
        activeDotColor: AppColors.darkBlue900,
        dotColor: AppColors.lightBlue700,
      ),
    );
  }
}