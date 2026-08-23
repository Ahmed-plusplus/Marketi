import 'package:marketi/core/network/api/end_ponits.dart';

class CategoryModel {
  String? slug;
  String? name;
  String? url;
  String? image;

  CategoryModel({this.slug, this.name, this.url, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    slug = json[ApiKey.slug];
    name = json[ApiKey.name];
    url = json[ApiKey.url];
    image = json[ApiKey.image];
  }

  Map<String, dynamic> toJson() => {
    ApiKey.slug: slug,
    ApiKey.name: name,
    ApiKey.url: url,
    ApiKey.image: image
  };
}
