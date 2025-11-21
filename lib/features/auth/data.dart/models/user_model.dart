import 'package:chickens/features/auth/domain.dart/entites/user_entites.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntites{
  UserModel({required super.name, required super.email, required super.password,});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      password: '', 
    );
  }
}