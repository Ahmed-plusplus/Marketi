import 'package:marketi/core/network/api/end_ponits.dart';

import 'submodels/category_model.dart';

class CategoriesModel {
  List<CategoryModel>? list;

  CategoriesModel({this.list});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.list] != null) {
      list = <CategoryModel>[];
      json[ApiKey.list].forEach((v) {
        list!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
    ApiKey.list: list?.map((v) => v.toJson()).toList(),
  };
}
