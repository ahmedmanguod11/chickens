import 'package:chickens/core/widgets/searsh_text_field.dart';
import 'package:chickens/features/home/presentaion/views/widgets/best_seller_grid_view.dart';
import 'package:chickens/features/home/presentaion/views/widgets/best_seller_header.dart';
import 'package:chickens/features/home/presentaion/views/widgets/custom_home_app_bar.dart';
import 'package:chickens/features/home/presentaion/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: Column(
          children: [
            CustomHomeAppBar(),
            // SizedBox(height: 2),
            SearchTextField(),
            SizedBox(height: 7),
            FeaturedItem(),
            SizedBox(height: 7),
            BestSellerHeader(),
            SizedBox(height: 7),

          ],

        ),

        ),
                            BestSellerGridView(),

      ],
    );
  }
}