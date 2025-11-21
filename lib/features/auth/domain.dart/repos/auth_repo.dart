

import 'package:chickens/core/errors/failures.dart';
import 'package:chickens/features/auth/domain.dart/entites/user_entites.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntites>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

}
