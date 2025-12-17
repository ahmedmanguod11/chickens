import 'package:chickens/constants.dart';
import 'package:chickens/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

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
                      title: 'حسابي',
                      showNotification: false,
                      showBackButton: false,
                    ),
                    const SizedBox(
                  height: 16,
                ),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
      
  }
}