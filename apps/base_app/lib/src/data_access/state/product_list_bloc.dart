import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/src/data_access/state/product_list_event.dart';
import 'package:flutter_base_app/src/data_access/state/product_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';
import '../repository/product_list_repository.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepository productListRepository;
  List<Product>? productLists;

  ProductListBloc({required this.productListRepository})
    : super(ProductListInitialState()) {
    on<GetProductListEvent>((event, emit) async {
      try {
        final token = await getLoginToken();
        debugPrint('token---->$token');
        final productList = await productListRepository.getProductList(
          token: token ?? 'token',
        );

        if (productList != null && productList.isNotEmpty) {
          productLists = productList;
          emit(GetProductListState(productList: productList));
        } else {
          emit(ProductListEmptyState());
        }
      } catch (err) {
        debugPrint('=======$err');
      }
    });
  }

  Future<String?> getLoginToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('login_token');
  }
}
