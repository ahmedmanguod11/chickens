import 'package:chickens/constants.dart';
import 'package:chickens/core/services/shared_preferences_singleton.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/widgets/custom_button.dart';
import 'package:chickens/features/home/presentaion/views/home_view.dart';
import 'package:chickens/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// الصفحات
        Expanded(child: OnBoardingPageView(pageController: pageController)),

        /// مؤشر النقاط
        DotsIndicator(
          dotsCount: 3,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withAlpha(100),
          ),
        ),
        const SizedBox(height: 11),

        /// الزر يظهر في الصفحة الثانية فقط
        Visibility(
          visible: currentPage == 2,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
            child: CustomButton(
              text: 'ابدأ الآن',
              onPressed: () {
                Prefs.setBool(KisOnBordingViewSeen, true);
                Navigator.of(context).pushReplacementNamed(HomeView.routName);
              },
            ),
          ),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
