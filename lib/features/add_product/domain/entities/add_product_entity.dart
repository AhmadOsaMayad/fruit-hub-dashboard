import 'dart:io';

class AddProductEntity {
  final File image;
  final String name;
  final String code;
  final String description;
  final num price;
  final int quantity;
  final bool isFeatured;
  String? imageUrl;

  AddProductEntity({
    required this.image,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.quantity = 1,
    this.imageUrl,
  });
}
