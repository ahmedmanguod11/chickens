import 'package:chickens/features/home/presentaion/cubits/cart_cubit/cart_cubit.dart';
import 'package:chickens/features/home/presentaion/views/widgets/car_items_list.dart';
import 'package:chickens/features/home/presentaion/views/widgets/cart_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: kTopPaddding,
                    ),
                    buildAppBar(
                      context,
                      title: 'السلة',
                      showNotification: false,
                      showBackButton: false,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CartHeader(),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? const SizedBox()
                    : const CustomDivider(),
              ),
              CarItemsList(
                carItems: context.watch<CartCubit>().cartEntity.cartItems,
              ),
              SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? const SizedBox()
                    : const CustomDivider(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, ),
          child: Row(
            children: [
              Expanded(
                child: CustomCartButton(), // زر الدفع العادي
              ),
              const SizedBox(width: 10),
             Expanded(
  child: ElevatedButton(
    onPressed: () {
      // تنفيذ منطق إرسال الفاتورة بدون دفع
      // context.read<CartCubit>().sendInvoiceOnly();
      // showBar(context, 'تم إرسال الفاتورة، الدفع عند التسليم');
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // نفس CustomCartButton
      ),
      backgroundColor: Colors.orange, // لون مميز للفاتورة
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16), // نفس البادينج
    ),
    child: Text(
      'إرسال الفاتورة',
      style: const TextStyle(
        fontSize: 16, // نفس حجم النص في CustomCartButton
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
)

            ],
          ),
        ),
      ],
    );
  }
}
