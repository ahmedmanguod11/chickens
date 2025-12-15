import 'package:chickens/core/entities/product_entity.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_network_image.dart';
import 'package:chickens/features/home/presentaion/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChickensItem extends StatelessWidget {
  const ChickensItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Column(
                children: [
                  Expanded(
                    child: productEntity.imageUrl != null
                        ? CustomNetworkImage(imageUrl: productEntity.imageUrl!)
                        : Container(
                            color: Colors.grey[300],
                            width: double.infinity,
                            child: const Icon(Icons.image, size: 40),
                          ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      productEntity.name,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.bold13,
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${productEntity.price} جنية ',
                            style: AppTextStyles.bold13.copyWith(color: Colors.orange[600]),
                          ),
                          TextSpan(
                            text: '/ الكيلو',
                            style: AppTextStyles.bold13.copyWith(color: Colors.orange[300]),
                          ),
                        ],
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                      context.read<CartCubit>().addProduct(productEntity);
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
