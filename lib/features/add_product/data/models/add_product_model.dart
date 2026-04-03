import 'dart:io';

import 'package:fruithub_dashboard/core/utils/back_end_points.dart';
import 'package:fruithub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
  final File image;
  final String name;
  final String code;
  final String description;
  final num price;
  final int quantity;
  final bool isFeatured;
  String? imageUrl;
  final String expDate;
  final num calPer100g;
  final num avgRating;
  final int avgCount;
  final List<ReviewModel> reviews;

  AddProductModel({
    required this.image,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.quantity = 1,
    this.imageUrl,
    required this.expDate,
    this.calPer100g = 0,
    this.avgRating = 0,
    this.avgCount = 0,
    required this.reviews,
  });

  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      image: entity.image,
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      isFeatured: entity.isFeatured,
      quantity: entity.quantity,
      imageUrl: entity.imageUrl,
      expDate: entity.expDate,
      calPer100g: entity.calPer100g,
      avgRating: entity.avgRating,
      avgCount: entity.avgCount,
      reviews: entity.reviews
          .map((review) => ReviewModel.fromEntity(review))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DKWords.name: name,
      DKWords.code: code,
      DKWords.description: description,
      DKWords.price: price,
      DKWords.quantity: quantity,
      DKWords.isFeatured: isFeatured,
      DKWords.imageUrl: imageUrl,
      DKWords.expMonths: expDate,
      DKWords.calPer100g: calPer100g,
      DKWords.avgRating: avgRating,
      DKWords.avgCount: avgCount,
      DKWords.reviews: reviews.map((review) => review.toJson()).toList(),
    };
  }
}
