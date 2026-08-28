import 'package:dartz/dartz.dart';
import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/end_ponits.dart';
import 'package:marketi/core/network/errors/exceptions.dart';
import 'package:marketi/core/network/errors/failure.dart';
import 'package:marketi/core/storage/cache/cache_helper.dart';
import 'package:marketi/core/storage/cache/cache_key.dart';
import 'package:marketi/features/auth/data/models/signin_request.dart';
import 'package:marketi/features/auth/data/models/signin_response.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';

class AuthRepository {

  ApiConsumer api;
  CacheHelper cacheHelper;

  AuthRepository({required this.api, required this.cacheHelper});

  Future<Either<SignInResponse, Failure>> login(SignInRequest request) async{
    try {
      var response = await api.post(EndPoint.signIn, data: request.toJson());
      var responseModel = SignInResponse.fromJson(response);
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

  Future<Either<String, Failure>> signup(SignupRequest params) async{
    try {
      var response = await api.post(EndPoint.signUp, data: params.toJson());
      var message = response[ApiKey.message];
      return Left(message);
    } on ServerException catch(e){
      return Right(Failure(errMessage: e.errModel.errorMessage));
    }
  }

  Future<Either<String, Failure>> sendSMS(String phone) async{
    return Left('success');
  }
}