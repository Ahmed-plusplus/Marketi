import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/dio_consumer.dart';
import 'package:marketi/core/storage/cache/cache_helper.dart';
import 'package:marketi/features/auth/data/repositories/auth_repository.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  ApiConsumer api = getIt<DioConsumer>();
  CacheHelper cacheHelper = getIt<CacheHelper>();
  getIt.registerSingleton<AuthRepository>(AuthRepository(api: api, cacheHelper: cacheHelper));
}