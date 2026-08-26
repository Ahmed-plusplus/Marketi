import 'package:dio/dio.dart';
import 'package:marketi/core/service/service_locator.dart';
import 'package:marketi/core/storage/cache/cache_helper.dart';
import 'package:marketi/core/storage/cache/cache_key.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['Accept-Language'] = "en";
    var token = getIt<CacheHelper>().getData(key: CacheKey.token);
    if(token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
