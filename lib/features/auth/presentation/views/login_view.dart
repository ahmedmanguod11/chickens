import 'package:chickens/core/services/get_it_service.dart';
import 'package:chickens/core/widgets/custom_app_bar.dart';
import 'package:chickens/features/auth/domain.dart/repos/auth_repo.dart';
import 'package:chickens/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:chickens/features/auth/presentation/views/widget/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routName = "login";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<AuthRepo>()
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: const LoginViewBody(),
      ),
    );
  }
}
