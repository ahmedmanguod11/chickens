import 'package:chickens/core/widgets/build_app_bar.dart';
import 'package:chickens/features/best_selling_chickens/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best-selling';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar( context, title: 'الأكثر مبيعاً'),
      body: BestSellingViewBody(),
    );
  }
}