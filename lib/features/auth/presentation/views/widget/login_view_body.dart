import 'package:chickens/constants.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_button.dart';
import 'package:chickens/core/widgets/custom_text_form_field.dart';
import 'package:chickens/core/widgets/dont_have_an_account.dart';
import 'package:chickens/core/widgets/or_divider.dart';
import 'package:chickens/core/widgets/password_field.dart';
import 'package:chickens/core/widgets/social_login_button.dart';
import 'package:chickens/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
 AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 25),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                    
                  },
                  hintText: 'البريد الألكتروني',
                  textInputType: TextInputType.emailAddress,
                  suffixIcon: Icon(Icons.email, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                  
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
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    context.read<LoginCubit>().LoginUser(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {
                      
                    });

                  }
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
      ),
    );
  }
}
