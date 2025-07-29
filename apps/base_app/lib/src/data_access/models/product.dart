class Product {
  final String id;
  final String name;
  final String? description;
  final String createdAt;
  final String belongsToId;

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.belongsToId,
  });
}
