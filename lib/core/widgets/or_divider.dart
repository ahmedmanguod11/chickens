import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        SizedBox(width: 16),
        Text(
          'أو',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyBaseRegular,
        ),
        SizedBox(width: 16),

        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
