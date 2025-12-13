import 'dart:developer';

import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/features/checkout/domain/entites/order_entity.dart';
import 'package:chickens/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    log(context.read<OrderInputEntity>().toString());
    return PaymentItem(
      tile: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.cart,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            ' ${context.read<OrderInputEntity>().shippingAddressEntity}',
            textAlign: TextAlign.right,
            style: AppTextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.apple,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'تعديل',
                    style: AppTextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
