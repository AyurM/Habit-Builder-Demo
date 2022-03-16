import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_builder_demo/data/model/sign_up_data.dart';
import 'package:habit_builder_demo/data/model/user_profile.dart';
import 'package:habit_builder_demo/data/repositories/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(SignUpInitial());

  final AuthRepository _authRepository;

  Future<void> onLoginWithGoogle() async {
    emit(SignUpLoading());
    try {
      final UserProfile userProfile = await _authRepository.signInWithGoogle();
      emit(SignUpContinueWithGoogle(userProfile));
    } catch (error) {
      emit(SignUpError(error.toString()));
    }
  }

  Future<void> onLoginWithFacebook() async {
    emit(SignUpLoading());
    try {
      final UserProfile userProfile =
          await _authRepository.signInWithFacebook();
      emit(SignUpContinueWithFacebook(userProfile));
    } catch (error) {
      emit(SignUpError(error.toString()));
    }
  }

  Future<void> onCreateAccount(SignUpData signUpData) async {
    emit(SignUpLoading());
    try {
      final UserProfile userProfile =
          await _authRepository.createAccount(signUpData);
      emit(SignUpCreatedAccount(userProfile));
    } catch (error) {
      emit(SignUpError(error.toString()));
    }
  }
}
