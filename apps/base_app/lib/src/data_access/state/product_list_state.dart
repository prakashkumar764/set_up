import '../models/product.dart';

abstract class ProductListState {
  const ProductListState();
}

class ProductListInitialState implements ProductListState {
  ProductListInitialState();
}

class GetProductListState implements ProductListState {
  final List<Product>? productList;
  GetProductListState({required this.productList});
}

class ProductListEmptyState implements ProductListState {
  ProductListEmptyState();
}
