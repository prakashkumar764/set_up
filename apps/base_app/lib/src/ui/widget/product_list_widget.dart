import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/src/data_access/state/product_list_bloc.dart';
import 'package:flutter_base_app/src/data_access/state/product_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_access/models/product.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductListBloc, ProductListState>(
      listenWhen: (previous, current) => current is GetProductListState,
      listener: (context, state) {
        if (state is GetProductListState) {
          debugPrint('======= Product List');
        } else if (state is ProductListEmptyState) {
          debugPrint('======= Empty List');
        }
      },
      builder: (context, state) {
        List<Product>? products = [];

        if (state is GetProductListState) {
          products = state.productList;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (products != null && products.isNotEmpty) ...{
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final product = products?[index];
                      return Card(
                        elevation: 5,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Image.network(
                                  'https://farm4.staticflickr.com/3752/9684880330_9b4698f7cb_z_d.jpg',
                                ),
                              ),
                              const SizedBox(height: 10), //SizedBox
                              DSText(
                                text: product?.name ?? '',
                                textStyle: DSTextStyleType.primaryButtonLMedium,
                                textColor: Colors.black,
                              ),
                              const SizedBox(height: 8), //SizedBox
                              const DSText(
                                text:
                                    'It contains well written and well explained text and much more!!',
                                textStyle:
                                    DSTextStyleType.primaryButtonLRegular,
                                textColor: Colors.black,
                              ),
                              const SizedBox(height: 12), //Si
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
