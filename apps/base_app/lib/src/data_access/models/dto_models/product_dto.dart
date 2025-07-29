class ProductDto {
  final String id;
  final String name;
  final String? description;
  final String createdAt;
  final String belongsToId;

  ProductDto({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.belongsToId,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    createdAt: json["createdAt"],
    belongsToId: json["belongsToId"],
  );
}
