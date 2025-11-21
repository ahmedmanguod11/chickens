import 'package:chickens/constants.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_button.dart';
import 'package:chickens/core/widgets/custom_text_form_field.dart';
import 'package:chickens/core/widgets/or_divider.dart';
import 'package:chickens/core/widgets/social_login_button.dart';
import 'package:chickens/features/auth/presentation/cubits/signup_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

late String email, password, username;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  username = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
                suffixIcon: Icon(Icons.person, color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
          
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                hintText: 'البريد الألكتروني',
                textInputType: TextInputType.emailAddress,
                suffixIcon: Icon(Icons.email, color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
          
              CustomTextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey[600]),
              ),
              
              SizedBox(height: 30),
              CustomButton(text: "انشاء حساب جديد", onPressed: () {
                if (formKey.currentState!.validate()) {
                  // autovalidateMode = AutovalidateMode.disabled;
                  formKey.currentState!.save();
                  context.read<SignupCubit>().signUp(email, password, username); // context.read<SignupCubit>().createUserWithEmailAndPassword(email, password, username);
                } else {

                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              }),
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
      ),
    );
  }
}
