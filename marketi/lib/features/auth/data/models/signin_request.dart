import 'package:marketi/core/network/api/end_ponits.dart';

class SignInRequest {

  String email;
  String password;


  SignInRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    ApiKey.email: email,
    ApiKey.password: password
  };
}