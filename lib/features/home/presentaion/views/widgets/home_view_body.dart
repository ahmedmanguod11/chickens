// home_view_body.dart
import 'package:chickens/core/cubits/products_cubit/products_cubit.dart';
import 'package:chickens/core/widgets/search_text_field.dart';
import 'package:chickens/features/home/presentaion/views/widgets/best_seller_grid_view_blocbuilder.dart';
import 'package:chickens/features/home/presentaion/views/widgets/best_seller_header.dart';
import 'package:chickens/features/home/presentaion/views/widgets/custom_home_app_bar.dart';
import 'package:chickens/features/home/presentaion/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBestSellingroducts();
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
                const CustomHomeAppBar(),

                // مربع البحث الديناميكي
                SearchTextField(
                  onSearch: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                  },
                ),

                const SizedBox(height: 7),
                const FeaturedItem(),
                const SizedBox(height: 7),
                const BestSellerHeader(),
                const SizedBox(height: 7),
              ],
            ),
          ),

          // GridView للمنتجات مع البحث
          BestSellerGridViewBlocbuilder(searchQuery: searchQuery),
        ],
      ),
    );
  }
}
