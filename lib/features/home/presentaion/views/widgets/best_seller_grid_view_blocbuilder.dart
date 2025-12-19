import 'package:chickens/core/cubits/products_cubit/products_cubit.dart';
import 'package:chickens/core/helper_functions/get_dummy_product.dart';
import 'package:chickens/core/widgets/custom_error_widget.dart';
import 'package:chickens/features/home/presentaion/views/widgets/best_seller_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerGridViewBlocbuilder extends StatelessWidget {
  final String searchQuery; // إضافة متغير البحث

  const BestSellerGridViewBlocbuilder({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          // فلترة المنتجات حسب البحث
          final filteredProducts = state.products
              .where((product) =>
                  product.name.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();

          if (filteredProducts.isEmpty) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'لا توجد منتجات مطابقة للبحث',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          }

          return BestSellerGridView(products: filteredProducts);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: BestSellerGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
