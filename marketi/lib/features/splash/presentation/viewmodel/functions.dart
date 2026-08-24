import 'package:marketi/core/routes/app_navigation.dart';

void delayedNavigate(context, path) {
  Future.delayed(
    const Duration(seconds: 2),
        () {
      customReplacementNavigate(context, path);
    },
  );
}