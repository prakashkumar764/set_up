import 'package:flutter_base_app/src/data_access/data_source/default_product_list_remote_data_source.dart';
import 'package:flutter_base_app/src/data_access/models/product.dart';
import 'package:flutter_base_app/src/data_access/models/user_mapper.dart';
import 'package:flutter_base_app/src/data_access/repository/product_list_repository.dart';

class DefaultProductListRepository implements ProductListRepository {
  final DefaultProductListRemoteDataSource dataSource;

  static DefaultProductListRepository? _instance;

  DefaultProductListRepository._internal(this.dataSource);

  factory DefaultProductListRepository(
    DefaultProductListRemoteDataSource dataSource,
  ) {
    return _instance ??= DefaultProductListRepository._internal(dataSource);
  }

  @override
  Future<List<Product>?> getProductList({required String token}) async {
    final dtoList = await dataSource.getProductList(token: token);
    if (dtoList == null) return null;
    return dtoList.map((dto) => dto.toDomain()).toList();
  }
}
