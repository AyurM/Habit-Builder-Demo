import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_builder_demo/data/model/user_profile.dart';
import 'package:habit_builder_demo/data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(LoginInitial());

  late final AuthRepository _authRepository;

  Future<void> onLoginWithGoogle() async {
    emit(LoginLoading());
    try {
      final UserProfile userProfile = await _authRepository.signInWithGoogle();
      emit(LoginContinueWithGoogle(userProfile));
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }

  Future<void> onLoginWithFacebook() async {
    emit(LoginLoading());
    try {
      final UserProfile userProfile =
          await _authRepository.signInWithFacebook();
      emit(LoginContinueWithFacebook(userProfile));
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }

  void onForgotPassword() => emit(const LoginForgotPassword('Forgot password'));

  void onSignUp() => emit(const LoginSignUp('Sign up'));

  void onHelpButtonPressed() => emit(LoginHelpButtonPressed());

  void onHelpDialogClosed() => emit(LoginHelpDialogClosed());

  Future<void> onLogin(String email, String password) async {
    emit(LoginLoading());
    try {
      final UserProfile userProfile =
          await _authRepository.loginWithEmailAndPassword(email, password);
      emit(LoginContinueWithGoogle(userProfile));
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }

  String? emailValidator(String? emailInput) {
    if (emailInput == null || emailInput.isEmpty) {
      return 'Please enter email';
    }
    return null;
  }

  String? passwordValidator(String? passwordInput) {
    if (passwordInput == null || passwordInput.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}
