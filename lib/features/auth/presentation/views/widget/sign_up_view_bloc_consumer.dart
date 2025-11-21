import 'package:chickens/features/auth/presentation/cubits/signup_cubit.dart';
import 'package:chickens/features/auth/presentation/cubits/signup_state.dart';
import 'package:chickens/features/auth/presentation/views/widget/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<SignupCubit, SignUpState>
   (listener: (context, state) {
      if (state is SignUpSuccess) {

      } else if (state is SignUpFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
            backgroundColor: Colors.red,
            showCloseIcon: true,
            
          ),
        );
      }
   },
    
    builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is SignUpLoading ? true : false,
        child: const SignupViewBody());
    },
    );
    
  }
}
