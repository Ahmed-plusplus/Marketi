import 'package:marketi/core/network/api/end_ponits.dart';

class ProductParams {
  int? skip;
  int? limit;
  String? sortBy;
  String? order;
  List<String>? select;


  ProductParams({this.skip, this.limit, this.sortBy, this.order, this.select});

  Map<String, dynamic> toJson() => {
    ApiKey.skip: skip,
    ApiKey.limit: limit,
    ApiKey.sortBy: sortBy,
    ApiKey.order: order,
    ApiKey.select: select?.join(','),
  };
}