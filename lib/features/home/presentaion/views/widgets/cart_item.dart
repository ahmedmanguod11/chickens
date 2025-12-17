import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/widgets/custom_network_image.dart';
import 'package:chickens/features/home/domain/entites/car_item_entity.dart';
import 'package:chickens/features/home/presentaion/cubits/cart_cubit/cart_cubit.dart';
import 'package:chickens/features/home/presentaion/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:chickens/features/home/presentaion/views/widgets/cart_item_action_buttons.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CartItem extends StatefulWidget {
  
  const CartItem({super.key, required this.carItemEntity});
  final CartItemEntity carItemEntity;

  @override
  State<CartItem> createState() => _CartItemState();
}
class _CartItemState extends State<CartItem> {
  @override
  void initState() {
    super.initState();
    _loadCleaningPrice();
  }

  /// جلب سعر التنضيف لكل فرخة من Firebase
  Future<void> _loadCleaningPrice() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('ahmedadd')
          .doc('ahmedadd') // الكولكشن والدكيومنت اللي قولت عليه
          .get();

      if (doc.exists) {
        final price = (doc.data()?['ahmedadd'] ?? 0).toDouble(); // الفيلد نفس الاسم
        setState(() {
          widget.carItemEntity.extraPerChicken = price;
        });
      }
    } catch (e) {
      debugPrint('Error fetching cleaning price: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final carItem = widget.carItemEntity;

    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdated && current.cartItemEntity == carItem) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // صورة المنتج
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: CustomNetworkImage(imageUrl: carItem.productEntity.imageUrl!),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم المنتج وحذف
                    Row(
                      children: [
                        Text(carItem.productEntity.name, style: AppTextStyles.bold13),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => context.read<CartCubit>().deleteCarItem(carItem),
                          child: SvgPicture.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // السعر لكل كيلو
                    Text(
                      '${carItem.productEntity.price} جنيه لكل كيلو',
                      style: AppTextStyles.regular13.copyWith(color: AppColors.secondaryColor),
                    ),
                    const SizedBox(height: 8),

                    // الفراخ فقط
                    if (carItem.isChicken)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButton<String>(
                            value: carItem.chickenType,
                            hint: const Text('اختر نوع الفراخ'),
                            items: const [
                              DropdownMenuItem(value: 'سليمة', child: Text('سليمة')),
                              DropdownMenuItem(value: 'مخلي من العضم', child: Text('مخلي من العضم')),
                              DropdownMenuItem(value: 'متقطعة ٤ قطع', child: Text('متقطعة ٤ قطع')),
                              DropdownMenuItem(value: 'متقطعة ٦ قطع', child: Text('متقطعة ٦ قطع')),
                              DropdownMenuItem(value: 'متقطعة ٨ قطع', child: Text('متقطعة ٨ قطع')),
                              DropdownMenuItem(value: 'متقطعة كنتاكي', child: Text('متقطعة كنتاكي')),
                              DropdownMenuItem(value: 'للحشو', child: Text('للحشو')),
                            ],
                            onChanged: (value) {
                              carItem.chickenType = value!;
                              context.read<CartItemCubit>().updateCartItem(carItem);
                            },
                          ),

                          const SizedBox(height: 5),

                          // بوكس سعر التنضيف لكل فرخة (من Firebase)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '+${carItem.extraPerChicken.toStringAsFixed(0)} جنيه سعر التنضيف لكل فرخة',
                              style: AppTextStyles.regular13.copyWith(color: AppColors.secondaryColor),
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 8),

                    // وزن وعدد الفراخ
                    if (carItem.isChicken)
                      Column(
                        children: [
                          const Text('وزن الفرخة:'),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              initialValue: carItem.weightInKg?.toString() ?? '',
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                carItem.weightInKg = double.tryParse(value);
                                context.read<CartItemCubit>().updateCartItem(carItem);
                              },
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text('عدد الفراخ: ${carItem.quanitty}'),
                        ],
                      ),

                    const SizedBox(height: 10),

                    // أزرار التحكم والسعر النهائي
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: carItem),
                        const Spacer(),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '${carItem.calculateTotalPrice().toStringAsFixed(2)} جنيه',
                              style: AppTextStyles.bold16.copyWith(color: AppColors.secondaryColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
