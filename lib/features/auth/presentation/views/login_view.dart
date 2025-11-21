import 'package:chickens/core/widgets/custom_app_bar.dart';
import 'package:chickens/features/auth/presentation/views/widget/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routName = "login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل دخول'),
      body: const LoginViewBody(),
    );
  }
}
