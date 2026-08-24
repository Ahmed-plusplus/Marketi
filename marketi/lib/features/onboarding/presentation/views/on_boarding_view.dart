import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/features/onboarding/data/repositories/on_boarding_repository.dart';
import 'package:marketi/features/onboarding/presentation/viewmodel/cubit/on_boarding_cubit.dart';
import 'package:marketi/features/onboarding/presentation/viewmodel/cubit/on_boarding_states.dart';

import 'widgets/on_boarding_button.dart';
import 'widgets/on_boarding_widget_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
              listener: (context, state) {},
              builder: (context, state) {
                OnBoardingCubit cubit = OnBoardingCubit.get(context);
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    OnBoardingWidgetBody(
                      onPageChanged: (index) {
                        setState(() {
                          cubit.onPageChanged(index);
                        });
                      },
                      controller: controller,
                    ),
                    const SizedBox(height: 34),
                    OnBoardingButton(currentIndex: cubit.currentIndex, controller: controller),
                    const SizedBox(height: 48),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
