import 'package:marketi/core/network/api/end_ponits.dart';

class MetaModel {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  MetaModel({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  MetaModel.fromJson(Map<String, dynamic> json) {
    createdAt = json[ApiKey.createdAt];
    updatedAt = json[ApiKey.updatedAt];
    barcode = json[ApiKey.barcode];
    qrCode = json[ApiKey.qrCode];
  }

  Map<String, dynamic> toJson() => {
    ApiKey.createdAt: createdAt,
    ApiKey.updatedAt: updatedAt,
    ApiKey.barcode: barcode,
    ApiKey.qrCode: qrCode
  };
}