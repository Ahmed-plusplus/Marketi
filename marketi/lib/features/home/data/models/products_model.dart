import 'package:marketi/core/network/api/end_ponits.dart';

class ProductsModel {
  List<ProductsModel>? list;
  int? total;
  int? skip;
  int? limit;

  ProductsModel({this.list, this.total, this.skip, this.limit});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json[ApiKey.list] != null) {
      list = <ProductsModel>[];
      json[ApiKey.list].forEach((v) {
        list!.add(ProductsModel.fromJson(v));
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
