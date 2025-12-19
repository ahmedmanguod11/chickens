
// products_grid_view_bloc_builder.dart
import 'package:chickens/core/cubits/products_cubit/products_cubit.dart';
import 'package:chickens/core/widgets/custom_error_widget.dart';
import 'package:chickens/features/home/presentaion/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:chickens/core/helper_functions/get_dummy_product.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  final String searchQuery;

  const ProductsGridViewBlocBuilder({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          final filteredProducts = state.products
              .where((p) => p.name.contains(searchQuery))
              .toList();
          return ProductsGridView(products: filteredProducts);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(child: CustomErrorWidget(text: state.errMessage));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
