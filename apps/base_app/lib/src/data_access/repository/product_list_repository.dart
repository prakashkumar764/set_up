import 'package:flutter_base_app/src/data_access/models/product.dart';

abstract interface class ProductListRepository {
  Future<List<Product>?> getProductList({required String token});
}
