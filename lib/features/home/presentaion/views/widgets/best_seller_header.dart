import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          'الأكثر مبيعاً',
          style: AppTextStyles.bold13
        ),
        Spacer(),
        Text(
          'عرض الكل',
          style: AppTextStyles.bold16)
      ],
    );
  }
}