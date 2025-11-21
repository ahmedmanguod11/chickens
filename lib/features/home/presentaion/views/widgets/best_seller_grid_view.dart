import 'package:chickens/features/home/presentaion/views/widgets/chickens_item.dart';
import 'package:flutter/material.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(gridDelegate:
     SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 163/250,
      mainAxisSpacing: 2,
      crossAxisSpacing: 5,
      ),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: const ChickensItem(),
      );
    },);
  }
}