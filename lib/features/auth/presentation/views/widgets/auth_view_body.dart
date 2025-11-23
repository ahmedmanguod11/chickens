import 'package:chickens/constants.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_button.dart';
import 'package:chickens/core/widgets/custom_text_form_field.dart';
import 'package:chickens/core/widgets/or_divider.dart';
import 'package:chickens/core/widgets/password_field.dart';
import 'package:chickens/core/widgets/social_login_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // متغيرات لكل حقل
  late String username, email, phone, landline, address, password;

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
                  onSaved: (value) => username = value!,
                  hintText: 'اسم المستخدم',
                  textInputType: TextInputType.text,
                  suffixIcon: Icon(Icons.person, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) => email = value!,
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress,
                  suffixIcon: Icon(Icons.email, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                PasswordField(
                  onSaved: (value) => password = value!,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) => phone = value!,
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.phone,
                  suffixIcon: Icon(Icons.phone, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) => landline = value!,
                  hintText: 'رقم الأرضي (اختياري)',
                  textInputType: TextInputType.phone,
                  suffixIcon: Icon(Icons.home, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onSaved: (value) => address = value!,
                  hintText: 'العنوان التفصيلي',
                  textInputType: TextInputType.text,
                  suffixIcon: Icon(Icons.location_on, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
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
                CustomButton(
                  text: 'تسجيل دخول',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      
                      // حفظ البيانات في Firestore
                      await FirebaseFirestore.instance.collection('manguod').add({
                        'username': username,
                        'email': email,
                        'password': password,
                        'phone': phone,
                        'landline': landline,
                        'address': address,
                        'createdAt': Timestamp.now(),
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم تسجيل البيانات بنجاح')),
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                SizedBox(height: 16),
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
