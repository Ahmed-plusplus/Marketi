import 'package:dartz/dartz.dart';
import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/end_ponits.dart';
import 'package:marketi/core/network/errors/exceptions.dart';
import 'package:marketi/core/network/errors/failure.dart';
import 'package:marketi/core/storage/cache/cache_helper.dart';
import 'package:marketi/core/storage/cache/cache_key.dart';
import 'package:marketi/features/auth/data/models/signin_model.dart';
import 'package:marketi/features/auth/data/models/signup_params.dart';

class AuthRepository {

  ApiConsumer api;
  CacheHelper cacheHelper;

  AuthRepository({required this.api, required this.cacheHelper});

  Future<Either<SignInModel, Failure>> login({
    required String email,
    required String password,
  }) async{
    try {
      var response = await api.post(EndPoint.signIn, data: {
        ApiKey.email: email,
        ApiKey.password: password
      });
      var responseModel = SignInModel.fromJson(response);
      await _saveToken(responseModel.token);
      return Left(responseModel);
    } on ServerException catch(e){
      return Right(Failure(errMessage: e.errModel.errorMessage));
    }
  }

  Future<void> _saveToken(String? token) async{
    await cacheHelper.saveData(key: CacheKey.token, value: token);
  }

  String? getToken(){
    return cacheHelper.getData(key: CacheKey.token);
  }

  Future<Either<String, Failure>> signup(SignupParams params) async{
    try {
      var response = await api.post(EndPoint.signUp, data: {
        ApiKey.name: params.name,
        ApiKey.phone: params.phone,
        ApiKey.email: params.email,
        ApiKey.password: params.password,
        ApiKey.confirmPassword: params.password
      });
      var message = response[ApiKey.message];
      return Left(message);
    } on ServerException catch(e){
      return Right(Failure(errMessage: e.errModel.errorMessage));
    }
  }
}