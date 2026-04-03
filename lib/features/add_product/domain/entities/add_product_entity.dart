import 'dart:io';

import 'package:fruithub_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductEntity {
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
  final List<ReviewEntity> reviews;
  // final bool isOrganic;
  // final num orgPercentage;

  AddProductEntity({
    required this.image,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.expDate,
    this.quantity = 1,
    this.imageUrl,
    this.calPer100g = 0,
    this.avgRating = 0,
    this.avgCount = 0,
    required this.reviews,
  });
}
