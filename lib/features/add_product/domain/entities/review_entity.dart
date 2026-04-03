class ReviewEntity {
  final String name;
  final String image;
  final String description;
  final num rating;
  final String date;

  ReviewEntity({
    required this.rating,
    required this.name,
    required this.image,
    required this.description,
    required this.date,
  });
}
