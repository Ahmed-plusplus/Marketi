import 'package:marketi/core/network/api/end_ponits.dart';

class BrandModel {
  String? name;
  String? emoji;

  BrandModel({this.name, this.emoji});

  BrandModel.fromJson(Map<String, dynamic> json) {
    name = json[ApiKey.name];
    emoji = json[ApiKey.emoji];
  }

  Map<String, dynamic> toJson() => {
    ApiKey.name: name,
    ApiKey.emoji: emoji
  };
}