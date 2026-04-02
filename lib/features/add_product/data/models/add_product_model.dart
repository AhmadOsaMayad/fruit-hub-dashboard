import 'dart:io';

import 'package:fruithub_dashboard/core/utils/back_end_points.dart';
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

  AddProductModel({
    required this.image,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.quantity = 1,
    this.imageUrl,
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
    };
  }
}
