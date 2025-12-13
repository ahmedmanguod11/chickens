import 'package:chickens/features/home/presentaion/views/product_view.dart';
import 'package:flutter/material.dart';

import '../cart_view.dart';
import 'home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductView(),
        CartView(),
      ],
    );
  }
}
