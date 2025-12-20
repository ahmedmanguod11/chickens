// products_view_body.dart
import 'package:chickens/constants.dart';
import 'package:chickens/core/cubits/products_cubit/products_cubit.dart';
import 'package:chickens/core/widgets/custom_app_bar.dart';
import 'package:chickens/core/widgets/search_text_field.dart';
import 'package:chickens/features/home/presentaion/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:chickens/features/home/presentaion/views/widgets/products_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPaddding),
                buildAppBar(
                  context,
                  title: 'المنتجات',
                  showBackButton: false,
                  showNotification: false,
                ),
                const SizedBox(height: 16),

                // مربع البحث
                SearchTextField(
                  onSearch: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                  },
                ),

                const SizedBox(height: 12),

                // عرض عدد المنتجات بعد التصفية
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    int productsLength = 0;
                    if (state is ProductsSuccess) {
                      final filtered = state.products
                          .where((p) => p.name.contains(searchQuery))
                          .toList();
                      productsLength = filtered.length;
                    }
                    return ProductsViewHeader(productsLength: productsLength);
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          // GridView للمنتجات مع البحث
          ProductsGridViewBlocBuilder(searchQuery: searchQuery),
        ],
      ),
    );
  }
}
