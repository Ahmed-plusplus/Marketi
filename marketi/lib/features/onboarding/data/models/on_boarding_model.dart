import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/generated/assets.dart';

class OnBoardingModel {
  final AssetImage image;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    image: Assets.images.illustrationOnboarding1.provider() as AssetImage,
    title: AppStrings.onBoardingTitle1,
    subTitle: AppStrings.onBoardingBody1,
  ),
  OnBoardingModel(
    image: Assets.images.illustrationOnboarding2.provider() as AssetImage,
    title: AppStrings.onBoardingTitle2,
    subTitle: AppStrings.onBoardingBody2,
  ),
  OnBoardingModel(
    image: Assets.images.illustrationOnboarding3.provider() as AssetImage,
    title: AppStrings.onBoardingTitle3,
    subTitle: AppStrings.onBoardingBody3,
  ),
];