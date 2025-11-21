import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  // Constructor بياخد PageController من بره

  final PageController pageController;
  // المتغير اللي بيمسك الـ PageView ويتابع الصفحات

  @override
  Widget build(BuildContext context) {
    // return AnimatedBuilder(
    //   animation: pageController,
    //   builder: (context, _) {
    //     final pageCount = 3; // 👈 بقوا 3 صفحات
    //     final rawPage =
    //         pageController.hasClients
    //             ? ((pageController.page ??
    //                     pageController.initialPage.toDouble())
    //                 .round())
    //             : 0;

    // final currentPage = rawPage.clamp(0, pageCount - 1);

    return PageView(
      controller: pageController,
      children: [
        // صفحة 1
        PageViewItem(
          isVisibil: true,
          image: Image.asset("assets/images/222.png"),
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          subtitle: 'اكتشف تجربة تسوق فريدة ...',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في ', style: AppTextStyles.bodyBaseBold),
              Text(
                ' منجود',
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'manguod',
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),

        // صفحة 2
        PageViewItem(
          isVisibil: true,
          image: Image.asset("assets/images/111.png"),
          backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
          subtitle:
              'اختيارك المثالي لأشهى وأجود الدواجن الطازجة، بعناية خاصة وجودة مضمونة…',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('تسوق بسهوله مع ', style: AppTextStyles.bodyBaseBold),
              Text(
                'منجود',
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'manguod',
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),

        // صفحة 3
        PageViewItem(
          isVisibil: false,
          image: Image.asset("assets/images/333.png"),
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          subtitle: 'اطلب الآن واستمتع بخدمة توصيل سريعة وموثوقة.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ابدأ رحلتك مع ', style: AppTextStyles.bodyBaseBold),
              Text(
                'منجود ',
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'manguod',
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
