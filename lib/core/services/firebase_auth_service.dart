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
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً. الرجاء اختيار كلمة مرور أقوى.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقاً بهذا البريد الإلكتروني.',
        ); 
      } else { 
        throw CustomException(
          message: 'لقد حدث خطأ. الرجاء المحاولة مرة أخرى لاحقاً.',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'حدث خطأ غير متوقع في التسجيل. الرجاء المحاولة مرة أخرى لاحقاً.',
      );
    }
  }
}
//video 19