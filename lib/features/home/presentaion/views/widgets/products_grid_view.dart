import 'package:chickens/core/widgets/chickens_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/entities/product_entity.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return ChickensItem(
            productEntity: products[index],
          );
        });
  }
}
