import 'package:marketi/core/network/api/end_ponits.dart';

import 'submodels/user_model.dart';

class SignInResponse {
  String? message;
  String? token;
  UserModel? user;

  SignInResponse({this.message, this.token, this.user});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    message = json[ApiKey.message];
    token = json[ApiKey.token];
    user = json[ApiKey.user] != null ? UserModel.fromJson(json[ApiKey.user]) : null;
  }

  Map<String, dynamic> toJson() =>
      {
        ApiKey.message: message,
        ApiKey.token: token,
        ApiKey.user: user?.toJson(),
      };
}