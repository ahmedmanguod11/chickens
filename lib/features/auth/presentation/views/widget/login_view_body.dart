import 'package:chickens/constants.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_button.dart';
import 'package:chickens/core/widgets/custom_text_form_field.dart';
import 'package:chickens/core/widgets/dont_have_an_account.dart';
import 'package:chickens/core/widgets/or_divider.dart';
import 'package:chickens/core/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: AppTextStyles.bodySmallBold.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomButton(onPressed: () {
                Navigator.of(context).pushReplacementNamed('home_view');
              }, text: 'تسجيل دخول'),
              SizedBox(height: 16),
              const DontHaveAnAccount(),
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
      ),
    );
  }
}
