import 'package:flutter/material.dart';
import 'package:marketi/core/service/service_locator.dart';
import 'package:marketi/core/storage/cache/cache_helper.dart';
import 'package:marketi/core/storage/cache/cache_key.dart';
import 'package:marketi/generated/assets.dart';

import '../viewmodel/functions.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    bool isOnBoardingVisisted =
        getIt<CacheHelper>().getData(key: CacheKey.isOnBoardingVisited) ?? false;
    if (isOnBoardingVisisted == true) {
      // FirebaseAuth.instance.currentUser == null
      //     ? delayedNavigate(context, "/signIn")
      //     : FirebaseAuth.instance.currentUser!.emailVerified == true
      //     ? delayedNavigate(context, "/homeNavBar")
      //     :
      delayedNavigate(context, "/signIn");
    } else {
      delayedNavigate(context, "/onBoarding");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Assets.images.logoSplashScreen.image(width: 300, height: 256),),
    );
  }
}
