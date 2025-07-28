import 'package:dio/dio.dart';
import 'package:flutter_base_app/src/data_access/data_source/product_list_data_source.dart';
import 'package:flutter_base_app/src/data_access/models/dto_models/product_dto.dart';
import 'package:network/network.dart';

import '../models/dto_models/product_list_dto.dart';

class DefaultProductListRemoteDataSource implements ProductListDataSource {
  final BaseDioClient baseDioClient;
  static DefaultProductListRemoteDataSource? _instance;

  DefaultProductListRemoteDataSource._internal(this.baseDioClient);

  factory DefaultProductListRemoteDataSource(BaseDioClient baseDioClient) {
    return _instance ??= DefaultProductListRemoteDataSource._internal(
      baseDioClient,
    );
  }

  @override
  Future<List<ProductDto>?> getProductList({required String token}) async {
    final response = await baseDioClient.get(
      'https://demo-api-design.onrender.com/api/product',
      options: Options(headers: {'Authorization': token}),
    );

    final data = response.data;
    final productListDto = ProductListDto.fromJson(data);
    List<ProductDto>? productList = productListDto.data;
    return productList;
  }
}
