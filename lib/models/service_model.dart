class ServiceModel {
  final String id;
  final String categoryId;
  final String name;
  final String image;
  final double price;
  final double rating;
  final int reviewCount;
  final String duration;
  final String description;

  const ServiceModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.duration,
    required this.description
});
}