import 'package:marketi/core/network/api/end_ponits.dart';

class SignupRequest {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;

  SignupRequest({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword
  });

  Map<String, dynamic> toJson() => {
    ApiKey.name: name,
    ApiKey.phone: phone,
    ApiKey.email: email,
    ApiKey.password: password,
    ApiKey.confirmPassword: confirmPassword
  };

}