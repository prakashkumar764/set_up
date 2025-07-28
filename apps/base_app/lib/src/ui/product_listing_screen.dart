import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/src/ui/widget/product_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/network.dart';

import '../data_access/data_source/default_product_list_remote_data_source.dart';
import '../data_access/repository/default_product_list_repository.dart';
import '../data_access/state/product_list_bloc.dart';
import '../data_access/state/product_list_event.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  @override
  Widget build(BuildContext context) {
    final productListRepository = DefaultProductListRepository(
      DefaultProductListRemoteDataSource(BaseDioClient()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Listing Screen',
          style: TextStyle(color: Colors.white),
        ),
        leading: BackButton(color: Colors.white),
        backgroundColor: DSSemanticColors.appThemePrimaryColor,
      ),
      body: BlocProvider<ProductListBloc>(
        create:
            (context) =>
                ProductListBloc(productListRepository: productListRepository)
                  ..add(GetProductListEvent()),
        child: ProductListWidget(),
      ),
    );
  }
}
