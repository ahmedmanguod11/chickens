import 'package:chickens/constants.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_button.dart';
import 'package:chickens/core/widgets/custom_text_form_field.dart';
import 'package:chickens/core/widgets/or_divider.dart';
import 'package:chickens/core/widgets/social_login_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
              suffixIcon: Icon(Icons.person, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),

            CustomTextFormField(
              hintText: 'البريد الألكتروني',
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.email, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),

            CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),

            CustomTextFormField(
              hintText: 'العنوان بالتفصيل',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.maps_home_work, color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            CustomButton(text: "انشاء حساب جديد", onPressed: () {}),
            SizedBox(height: 16),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'تمتلك حساب بالفعل؟',
                    style: AppTextStyles.bodySmallRegular,
                  ),
                  TextSpan(
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                    text: 'تسجيل دخول',
                    style: AppTextStyles.bodySmallBold.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            OrDivider(),
            SizedBox(height: 15),
            SocialLoginButton(
              onPressed: () {},
              image: Assets.google,
              title: 'تسجيل بواسطة جوجل',
            ),
            SizedBox(height: 15),

            SocialLoginButton(
              onPressed: () {},
              image: Assets.facebook,
              title: 'تسجيل بواسطة فيسبوك',
            ),
            SizedBox(height: 15),

            SocialLoginButton(
              onPressed: () {},
              image: Assets.apple,
              title: 'تسجيل بواسطة أبل',
            ),
          ],
        ),
      ),
    );
  }
}
