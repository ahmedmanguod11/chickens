import 'package:chickens/features/auth/domain.dart/repos/auth_repo.dart';
import 'package:chickens/features/auth/presentation/cubits/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit({required this.authRepo}) : super(SignUpInitial());

  final AuthRepo authRepo;
  Future<void> signUp(String email, String password, String name) async {
    emit(SignUpLoading());

    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );

    result.fold( 
      (failure) => emit(SignUpFailure(failure.message)),
      (userEntites) => emit(SignUpSuccess(userEntites)),
    );
  }
}
