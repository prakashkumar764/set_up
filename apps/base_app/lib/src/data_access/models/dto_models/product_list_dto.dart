import 'package:flutter_base_app/src/data_access/models/dto_models/product_dto.dart';

class ProductListDto {
  List<ProductDto>? data;

  ProductListDto({required this.data});

  factory ProductListDto.fromJson(Map<String, dynamic> json) => ProductListDto(
    data:
        json["data"] == null
            ? []
            : List<ProductDto>.from(
              json["data"]!.map((x) => ProductDto.fromJson(x)),
            ),
  );
}
