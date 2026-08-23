
import 'package:marketi/core/network/api/end_ponits.dart';

class UserModel {
  String? name;
  String? phone;
  String? email;
  String? role;
  String? image;

  UserModel({this.name, this.phone, this.email, this.role, this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json[ApiKey.name];
    phone = json[ApiKey.phone];
    email = json[ApiKey.email];
    role = json[ApiKey.role];
    image = json[ApiKey.image];
  }

  Map<String, dynamic> toJson() => {
    ApiKey.name: name,
    ApiKey.phone: phone,
    ApiKey.email: email,
    ApiKey.role: role,
    ApiKey.image: image
  };
}
