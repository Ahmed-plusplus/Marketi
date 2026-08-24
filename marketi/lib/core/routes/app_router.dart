import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/features/onboarding/presentation/viewmodel/cubit/on_boarding_cubit.dart';
import 'package:marketi/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:marketi/features/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutesName.onBoarding,
      builder: (context, state) => BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: const OnBoardingView(),
      ),
    ),
  ]
);