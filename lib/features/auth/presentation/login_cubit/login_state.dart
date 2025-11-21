import 'package:chickens/features/auth/domain.dart/entites/user_entites.dart';

sealed class LoginState{}
final class LoginInitial extends LoginState{}
final class LoginLoading extends LoginState{}
final class LoginSuccess extends LoginState{
  final  UserEntites userEntites;

  LoginSuccess({required this.userEntites});
}
final class LoginFailure extends LoginState{
  final String message;

  LoginFailure(this.message);
}
