import 'package:fruithub_dashboard/core/utils/back_end_points.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String revName;
  final String revImage;
  final String revDesc;
  final num revRating;
  final String revDate;

  ReviewModel({
    required this.revRating,
    required this.revName,
    required this.revImage,
    required this.revDesc,
    required this.revDate,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      revName: entity.name,
      revImage: entity.image,
      revDesc: entity.description,
      revRating: entity.rating,
      revDate: entity.date,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      revName: json[DKWords.revName],
      revImage: json[DKWords.revImage],
      revDesc: json[DKWords.revDesc],
      revRating: json[DKWords.revRating],
      revDate: json[DKWords.revDate],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DKWords.revName: revName,
      DKWords.revImage: revImage,
      DKWords.revDesc: revDesc,
      DKWords.revRating: revRating,
      DKWords.revDate: revDate,
    };
  }
}
