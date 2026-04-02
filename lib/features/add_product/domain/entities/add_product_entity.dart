import 'dart:io';

class AddProductEntity {
  final File image;
  final String? imageUrl;
  final String name;
  final String code;
  final String description;
  final num price;
  final int quantity;

  AddProductEntity({
    required this.image,
    this.imageUrl,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.quantity,
  });
}
