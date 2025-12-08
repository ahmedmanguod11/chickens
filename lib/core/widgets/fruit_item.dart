import 'package:chickens/core/entities/product_entity.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                productEntity.imageUrl != null
                    ? Flexible(
                        child: CustomNetworkImage(
                            imageUrl: productEntity.imageUrl!),
                      )
                    : Container(
                        color: Colors.grey,
                        height: 100,
                        width: 100,
                      ),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price}جنية ',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: AppTextStyles.semiBold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'كيلو',
                          style: AppTextStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
