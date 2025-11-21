import 'package:chickens/features/auth/domain.dart/entites/user_entites.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntites userEntites;

  SignUpSuccess(this.userEntites);
}

class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure(this.message);
}
