
import 'package:chickens/core/widgets/custom_progress_hud.dart';
import 'package:chickens/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:chickens/features/auth/presentation/login_cubit/login_state.dart';
import 'package:chickens/features/auth/presentation/views/widget/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        if(state is LoginLoading){
          
        }
        return CustomProgressHud(
          isLoading: state is LoginLoading ? true : false,
          child: const LoginViewBody());
      },
      );
  }


}