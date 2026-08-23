import 'package:marketi/core/network/api/end_ponits.dart';

import 'dimensions_model.dart';
import 'meta_model.dart';
import 'reviews_model.dart';

class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  DimensionsModel? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ReviewsModel>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  MetaModel? meta;
  List<String>? images;
  String? thumbnail;

  ProductModel(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.tags,
        this.brand,
        this.sku,
        this.weight,
        this.dimensions,
        this.warrantyInformation,
        this.shippingInformation,
        this.availabilityStatus,
        this.reviews,
        this.returnPolicy,
        this.minimumOrderQuantity,
        this.meta,
        this.images,
        this.thumbnail});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json[ApiKey.id];
    title = json[ApiKey.title];
    description = json[ApiKey.description];
    category = json[ApiKey.category];
    price = json[ApiKey.price];
    discountPercentage = json[ApiKey.discountPercentage];
    rating = json[ApiKey.rating];
    stock = json[ApiKey.stock];
    tags = json[ApiKey.tags].cast<String>();
    brand = json[ApiKey.brand];
    sku = json[ApiKey.sku];
    weight = json[ApiKey.weight];
    dimensions = json[ApiKey.dimensions] != null
        ? DimensionsModel.fromJson(json[ApiKey.dimensions])
        : null;
    warrantyInformation = json[ApiKey.warrantyInformation];
    shippingInformation = json[ApiKey.shippingInformation];
    availabilityStatus = json[ApiKey.availabilityStatus];
    if (json[ApiKey.reviews] != null) {
      reviews = <ReviewsModel>[];
      json[ApiKey.reviews].forEach((v) {
        reviews!.add(ReviewsModel.fromJson(v));
      });
    }
    returnPolicy = json[ApiKey.returnPolicy];
    minimumOrderQuantity = json[ApiKey.minimumOrderQuantity];
    meta = json[ApiKey.meta] != null ? MetaModel.fromJson(json[ApiKey.meta]) : null;
    images = json[ApiKey.images].cast<String>();
    thumbnail = json[ApiKey.thumbnail];
  }

  Map<String, dynamic> toJson() => {
    ApiKey.id: id,
    ApiKey.title: title,
    ApiKey.description: description,
    ApiKey.category: category,
    ApiKey.price: price,
    ApiKey.discountPercentage: discountPercentage,
    ApiKey.rating: rating,
    ApiKey.stock: stock,
    ApiKey.tags: tags,
    ApiKey.brand: brand,
    ApiKey.sku: sku,
    ApiKey.weight: weight,
    ApiKey.dimensions: dimensions?.toJson(),
    ApiKey.warrantyInformation: warrantyInformation,
    ApiKey.shippingInformation: shippingInformation,
    ApiKey.availabilityStatus: availabilityStatus,
    ApiKey.reviews: reviews?.map((v) => v.toJson()).toList(),
    ApiKey.returnPolicy: returnPolicy,
    ApiKey.minimumOrderQuantity: minimumOrderQuantity,
    ApiKey.meta: meta?.toJson(),
    ApiKey.images: images,
    ApiKey.thumbnail: thumbnail
  };
}
