import 'package:flutter/material.dart';
import 'package:marketi/features/onboarding/data/models/on_boarding_model.dart';

import 'on_boarding_indicator.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  OnBoardingWidgetBody({super.key, required this.onPageChanged, required this.controller});

  Function(int) onPageChanged;
  PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 290,
                width: 343,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: onBoardingData[index].image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              OnBoardingIndicator(controller: controller),
              const SizedBox(height: 32),
              Text(
                onBoardingData[index].title,
                style: TextTheme.of(context).titleLarge,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                onBoardingData[index].subTitle,
                style: TextTheme.of(context).bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 6,
              ),
            ],
          );
        },
      ),
    );
  }
}
