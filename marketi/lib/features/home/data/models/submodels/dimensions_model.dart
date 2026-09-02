import 'package:marketi/core/network/api/end_ponits.dart';

class DimensionsModel {
  double? width;
  double? height;
  double? depth;

  DimensionsModel({this.width, this.height, this.depth});

  DimensionsModel.fromJson(Map<String, dynamic> json) {
    width = (json[ApiKey.width] as num?)?.toDouble();
    height = (json[ApiKey.height] as num?)?.toDouble();
    depth = (json[ApiKey.depth] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() => {
    ApiKey.width: width,
    ApiKey.height: height,
    ApiKey.depth: depth
  };
}