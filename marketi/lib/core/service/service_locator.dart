import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/network/api/dio_consumer.dart';
import 'package:marketi/core/storage/cache/cache_helper.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}