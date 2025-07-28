import '../models/dto_models/product_dto.dart';

abstract interface class ProductListDataSource {
  Future<List<ProductDto>?> getProductList({required String token});
}
