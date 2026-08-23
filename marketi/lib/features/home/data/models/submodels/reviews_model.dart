import 'package:marketi/core/network/api/end_ponits.dart';

class ReviewsModel {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  ReviewsModel(
      {this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail});

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    rating = json[ApiKey.rating];
    comment = json[ApiKey.comment];
    date = json[ApiKey.date];
    reviewerName = json[ApiKey.reviewerName];
    reviewerEmail = json[ApiKey.reviewerEmail];
  }

  Map<String, dynamic> toJson() => {
    ApiKey.rating: rating,
    ApiKey.comment: comment,
    ApiKey.date: date,
    ApiKey.reviewerName: reviewerName,
    ApiKey.reviewerEmail: reviewerEmail
  };
}
