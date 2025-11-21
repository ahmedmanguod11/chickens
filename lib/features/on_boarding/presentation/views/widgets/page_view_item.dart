import 'package:chickens/constants.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isVisibil,
  });

  /// 👈 image هو ويدجت عشان يقبل Image.asset أو SvgPicture.asset
  final Widget image;
  final String backgroundImage; // الخلفية (SVG)
  final String subtitle;
  final Widget title;

  /// 👈 true = هيظهر زرار "تخطي" ، false = يختفي
  final bool isVisibil;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              // الخلفية SVG
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              // الصورة (Widget: ممكن تكون SVG أو PNG أو JPG)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: image,
              ),
              // زر "تخط" 👇
              if (isVisibil) // 👈 يظهر فقط لو isVisibil == true
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      (KisOnBordingViewSeen, true);
                      Navigator.of(context)
                          .pushReplacementNamed(LoginView.routName);
                    },
                    child: const Text(
                      'تخط',
                      style: AppTextStyles.bodyXSmallBold,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmallRegular.copyWith(
              color: Colors.grey[900],
            ),
          ),
        ),
      ],
    );
  }
}
