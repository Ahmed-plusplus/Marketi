import 'package:marketi/core/service/service_locator.dart';
import 'package:marketi/core/storage/cache/cache_helper.dart';
import 'package:marketi/core/storage/cache/cache_key.dart';

abstract class OnBoardingRepository {
  static void onBoardingVisited() {
    getIt<CacheHelper>().saveData(key: CacheKey.isOnBoardingVisited, value: true);
  }
}