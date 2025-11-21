import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(shape: OvalBorder(),
        color: Color(0xFFEEF8ED),
        ),
        child: SvgPicture.asset(Assets.notification),
      ),
      leading: Image.asset(Assets.profile),
      title:  Text("صباح الخير",
       style: AppTextStyles.bodyBaseRegular..copyWith(color: Colors.grey)),
       subtitle: Text(" احمد منجود",
       style: AppTextStyles.bodyBaseBold..copyWith(color: Colors.black87)),
    );
  }
}