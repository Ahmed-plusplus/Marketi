import 'package:marketi/core/network/api/end_ponits.dart';

class ProductFilterRequest {
  String? search;
  int? skip;
  int? limit;

  ProductFilterRequest({this.search, this.skip, this.limit});

  ProductFilterRequest.fromJson(Map<String, dynamic> json) {
    search = json[ApiKey.search];
    skip = json[ApiKey.skip];
    limit = json[ApiKey.limit];
  }

  Map<String, dynamic> toJson() => {
    ApiKey.search: search,
    ApiKey.skip: skip,
    ApiKey.limit: limit,
  };
}
