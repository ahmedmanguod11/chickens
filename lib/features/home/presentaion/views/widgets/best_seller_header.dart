import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/features/best_selling_chickens/presentation/views/best_selling_view.dart';
import 'package:flutter/material.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        children: [
          Text(
            'الأكثر مبيعاً',
            style: AppTextStyles.bold13
          ),
          Spacer(),
          Text(
            'المزيد...',
            style: AppTextStyles.regular16)
        ],
      ),
    );
  }
}