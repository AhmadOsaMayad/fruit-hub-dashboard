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
      revName: json[QKWords.revName],
      revImage: json[QKWords.revImage],
      revDesc: json[QKWords.revDesc],
      revRating: json[QKWords.revRating],
      revDate: json[QKWords.revDate],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      QKWords.revName: revName,
      QKWords.revImage: revImage,
      QKWords.revDesc: revDesc,
      QKWords.revRating: revRating,
      QKWords.revDate: revDate,
    };
  }
}
