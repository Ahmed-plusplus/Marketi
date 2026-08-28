import 'package:marketi/core/network/api/end_ponits.dart';

import 'submodels/product_model.dart';

class ProductsModel {
  List<ProductModel>? list;
  int? total;
  int? skip;
  int? limit;

  ProductsModel({this.list, this.total, this.skip, this.limit});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.list] != null) {
      list = <ProductModel>[];
      json[ApiKey.list].forEach((v) {
        list!.add(ProductModel.fromJson(v));
      });
    }
    total = json[ApiKey.total];
    skip = json[ApiKey.skip];
    limit = json[ApiKey.limit];
  }

  Map<String, dynamic> toJson() =>
      {
        ApiKey.list: list?.map((v) => v.toJson()).toList(),
        ApiKey.total: total,
        ApiKey.skip: skip,
        ApiKey.limit: limit
      };
}
