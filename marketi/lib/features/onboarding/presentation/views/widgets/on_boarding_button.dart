import 'package:flutter/material.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_elevated_button.dart';
import 'package:marketi/features/onboarding/data/models/on_boarding_model.dart';
import 'package:marketi/features/onboarding/data/repositories/on_boarding_repository.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key, required this.currentIndex, required this.controller});

  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return CustomElevatedButton(
        text: AppStrings.getStart,
        onPressed: () {
          OnBoardingRepository.onBoardingVisited();
          customReplacementNavigate(context, RoutesName.signIn);
        },
      );
    } else {
      return CustomElevatedButton(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(
            duration: const Duration(microseconds: 200),
            curve: Curves.bounceIn,
          );
        },
      );
    }
  }
}
