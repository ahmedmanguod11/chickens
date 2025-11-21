import 'package:chickens/features/auth/domain.dart/repos/auth_repo.dart';
import 'package:chickens/features/auth/presentation/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> signInUser(String email, String password) async {
    emit(LoginLoading());

    var result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userEntites) => emit(LoginSuccess(userEntites: userEntites)),
    );
  }
}
