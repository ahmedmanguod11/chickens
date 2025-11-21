import 'dart:developer';


import 'package:chickens/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
//Ahmed manguod
class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {

      log( 'FirebaseAuthException in createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً. الرجاء اختيار كلمة مرور أقوى.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقاً بهذا البريد الإلكتروني.',
        ); 
      } else { 
        throw CustomException(
          message: 'تأكد من اتصال الإنترنت وحاول مرة أخرى.',
        );
      }
    } catch (e) {    
        log( 'FirebaseAuthException in createUserWithEmailAndPassword: ${e.toString()}');

      throw CustomException(
        message: 'حدث خطأ غير متوقع في التسجيل. الرجاء المحاولة مرة أخرى لاحقاً.',
      );
    }
  }
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log( 'FirebaseAuthException in signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}');

      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'كلمة المرور او البريد الإلكتروني غير صحيحه.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور او البريد الإلكتروني غير صحيحه.');
      } else {
        throw CustomException(
          message: 'تأكد من اتصال الإنترنت وحاول مرة أخرى.',
        );
      }
    } catch (e) {
      log( 'Exception in signInWithEmailAndPassword: ${e.toString()}');

      throw CustomException(
        message: 'حدث خطأ غير متوقع في تسجيل الدخول. الرجاء المحاولة مرة أخرى لاحقاً.',
      );
    }
  }
}


