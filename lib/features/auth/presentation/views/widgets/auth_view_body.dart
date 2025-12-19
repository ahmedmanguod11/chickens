import 'package:chickens/constants.dart';
import 'package:chickens/core/services/shared_preferences_singleton.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_text_field.dart';
import 'package:chickens/core/widgets/password_field.dart';
import 'package:chickens/features/home/presentaion/views/main_view.dart';
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

  late String username, phone, address, password;
  String landline = "none";
  bool hasLandline = false;
  bool isLoading = false;

  void startLoading() {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
  }

  void stopLoading() {
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _handleLogin() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      startLoading();

      try {
        await FirebaseFirestore.instance.collection('manguod').add({
          'username': username,
          'password': password,
          'phone': phone,
          'landline': landline,
          'address': address,
          'hasLandline': hasLandline,
          'createdAt': Timestamp.now(),
        });

        await Prefs.setString('username', username);
         await Prefs.setString('phone', phone); 
         await Prefs.setString('address', address);
        await Prefs.setString('password', password);
        await Prefs.setString('landline', landline);
        await Prefs.setBool('hasLandline', hasLandline);

        await Prefs.setBool('loggedIn', true);

        if (!mounted) return;
        stopLoading();

        Navigator.pushReplacementNamed(context, MainView.routeName);
      } catch (e) {
        if (!mounted) return;
        stopLoading();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("حدث خطأ أثناء التسجيل")),
        );
      }
    } else {
      if (!mounted) return;
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  CustomTextFormField(
                    onSaved: (value) => username = value!,
                    hintText: 'اسم المستخدم',
                    textInputType: TextInputType.text,
                    suffixIcon: Icon(Icons.person, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  PasswordField(onSaved: (value) => password = value!),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    onSaved: (value) => phone = value!,
                    hintText: 'رقم الهاتف',
                    textInputType: TextInputType.phone,
                    suffixIcon: Icon(Icons.phone, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  Text("هل يوجد رقم أرضي؟", style: AppTextStyles.bold13),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: hasLandline,
                        onChanged: (value) {
                          if (!mounted) return;
                          setState(() {
                            hasLandline = value!;
                            landline = "none";
                          });
                        },
                      ),
                      const Text("لا يوجد"),
                      Radio(
                        value: true,
                        groupValue: hasLandline,
                        onChanged: (value) {
                          if (!mounted) return;
                          setState(() {
                            hasLandline = value!;
                          });
                        },
                      ),
                      const Text("يوجد"),
                    ],
                  ),
                  if (hasLandline)
                    CustomTextFormField(
                      onSaved: (value) => landline = value!,
                      hintText: 'رقم الأرضي',
                      textInputType: TextInputType.phone,
                      suffixIcon: Icon(Icons.home, color: Colors.grey[600]),
                    ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    onSaved: (value) => address = value!,
                    hintText: 'العنوان التفصيلي',
                    textInputType: TextInputType.text,
                    suffixIcon: Icon(Icons.location_on, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () => _handleLogin(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'تسجيل دخول',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
