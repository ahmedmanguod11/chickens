import 'dart:developer';

import 'package:chickens/core/errors/exceptions.dart';
import 'package:chickens/core/errors/failures.dart';
import 'package:chickens/core/services/firebase_auth_service.dart';
import 'package:chickens/features/auth/data.dart/models/user_model.dart';
import 'package:chickens/features/auth/domain.dart/entites/user_entites.dart';
import 'package:chickens/features/auth/domain.dart/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failures, UserEntites>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    
  ) async {  //jhk
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {

      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('حدث خطأ غير متوقع . الرجاء المحاولة مرة أخرى لاحقاً.'));
    }
  }
  
  @override
  Future<Either<Failures, UserEntites>> signInWithEmailAndPassword({required String email, required String password})async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('حدث خطأ غير متوقع . الرجاء المحاولة مرة أخرى لاحقاً.'));
    }
  }
}
