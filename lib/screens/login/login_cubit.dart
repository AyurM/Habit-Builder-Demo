import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_builder_demo/data/model/user_profile.dart';
import 'package:habit_builder_demo/data/repositories/auth_repository.dart';
import 'package:habit_builder_demo/utils/validation/form_validators.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(LoginInitial());

  final AuthRepository _authRepository;

  String? Function(String?) get emailValidator => FormValidator.emailValidator;

  String? Function(String?) get passwordValidator =>
      FormValidator.passwordValidator;

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

  void onForgotPassword() => emit(LoginForgotPassword());

  void onResetPasswordPageClosed() => emit(LoginForgotPasswordPageClosed());

  void onSignUp() => emit(LoginSignUp());

  void onSignUpPageClosed() => emit(LoginSignUpPageClosed());

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
}
