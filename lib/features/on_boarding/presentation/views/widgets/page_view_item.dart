import 'package:chickens/constants.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/features/auth/presentation/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chickens/core/services/shared_preferences_singleton.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isVisibil,
  });

  final Widget image;
  final String backgroundImage;
  final String subtitle;
  final Widget title;
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
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: image,
              ),
              if (isVisibil)
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setBool(KisOnBordingViewSeen, true);
                      Navigator.of(context).pushReplacementNamed(AuthView.routName);
                    },
                    child: const Text(
                      'تخط',
                      style: AppTextStyles.bold13,
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
            style: AppTextStyles.bold13.copyWith(
              color: Colors.grey[900],
            ),
          ),
        ),
      ],
    );
  }
}
