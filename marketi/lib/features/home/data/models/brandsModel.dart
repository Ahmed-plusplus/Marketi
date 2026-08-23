import 'package:marketi/core/network/api/end_ponits.dart';

import 'submodels/brand_model.dart';

class BrandsModel {
  List<BrandModel>? list;

  BrandsModel({this.list});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.list] != null) {
      list = <BrandModel>[];
      json[ApiKey.list].forEach((v) {
        list!.add(BrandModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
      ApiKey.list: list?.map((v) => v.toJson()).toList()
    };
}