// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chickens/core/entities/product_entity.dart';
import 'package:chickens/core/widgets/chickens_item.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({
    Key? key,
    required this.products,
  }) : super(key: key);
final List <ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate:
     SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 163/250,
      mainAxisSpacing: 2,
      crossAxisSpacing: 5,
      ),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child:  ChickensItem(productEntity: products[index],),
      );
    },);
  }
}
