import 'package:chickens/constants.dart';
import 'package:chickens/core/services/shared_preferences_singleton.dart';
import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/features/home/presentaion/views/home_view.dart';
import 'package:chickens/features/on_boarding/presentation/views/on_bording.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      excuteNavigation();
    });
  }

  void excuteNavigation() {
    if (_navigated) return;
    _navigated = true;

    bool isOnBordingViewSeen = Prefs.getBool(KisOnBordingViewSeen);

    if (isOnBordingViewSeen) {
      Navigator.pushReplacementNamed(context, HomeView.routName);
    } else {
      Navigator.pushReplacementNamed(context, OnBording.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              Assets.imagesPlan,
              height: 220,
              width: 170,
              fit: BoxFit.cover,
            ),
          ],
        ),

        // الصورة بدل الفيديو
        Center(
          child: SizedBox(
            height: 260,
            width: 200,
            child: Image.asset(
              Assets.imagesLogo, // غيّرها لمسار الصورة التي تريدها
              fit: BoxFit.contain,
            ),
          ),
        ),

        SvgPicture.asset(
          Assets.imagesSplashBootom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
