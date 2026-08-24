import 'package:flutter/material.dart';
import 'package:marketi/core/routes/app_router.dart';
import 'package:marketi/core/utils/app_themes.dart';

import 'core/service/service_locator.dart';
import 'core/storage/cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router,
    );
  }
}