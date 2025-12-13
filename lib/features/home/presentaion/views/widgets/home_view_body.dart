
import 'package:chickens/core/cubits/products_cubit/products_cubit.dart';
import 'package:chickens/core/widgets/search_text_field.dart';
import 'package:chickens/features/home/presentaion/views/widgets/best_seller_grid_view_blocbuilder.dart';
import 'package:chickens/features/home/presentaion/views/widgets/best_seller_header.dart';
import 'package:chickens/features/home/presentaion/views/widgets/custom_home_app_bar.dart';
import 'package:chickens/features/home/presentaion/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  void initState() {
context.read<ProductsCubit>().getBestSellingroducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column(
            children: [
              CustomHomeAppBar(),
              SearchTextField(),
              SizedBox(height: 7),
              FeaturedItem(),
              SizedBox(height: 7),
              BestSellerHeader(),
              SizedBox(height: 7),
      
            ],
      
          ),
      
          ),
               BestSellerGridViewBlocbuilder(),
      
        ],
      ),
    );
  }
}
