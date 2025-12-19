import 'package:chickens/core/widgets/custom_app_bar.dart';
import 'package:chickens/features/auth/presentation/views/widgets/auth_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const routName = "authview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        showBackButton: false,
        showNotification: false,
        context, title: 'تسجيل دخول'),
      body: AuthViewBody(),
    );
  }
}
