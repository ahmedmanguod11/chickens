import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
final String image;
final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1B5E37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(child: SvgPicture.asset(image)),
      
              ),
              const SizedBox(width: 4,),
              Text(text,style: AppTextStyles.bodyXSmallBold.copyWith(color: AppColors.primaryColor),)
            ],
          ),
      ),
    );
  }
}