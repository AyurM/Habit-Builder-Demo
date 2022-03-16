part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

abstract class LoginSuccess extends LoginState {
  final UserProfile profile;

  const LoginSuccess(this.profile);

  @override
  List<Object> get props => [profile];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}

class LoginContinueWithGoogle extends LoginSuccess {
  const LoginContinueWithGoogle(UserProfile profile) : super(profile);
}

class LoginContinueWithFacebook extends LoginSuccess {
  const LoginContinueWithFacebook(UserProfile profile) : super(profile);
}

class LoginSuccessful extends LoginSuccess {
  const LoginSuccessful(UserProfile profile) : super(profile);
}

class LoginHelpButtonPressed extends LoginState {}

class LoginHelpDialogClosed extends LoginState {}

class LoginForgotPassword extends LoginState {}

class LoginForgotPasswordPageClosed extends LoginState {}

class LoginSignUp extends LoginState {}

class LoginSignUpPageClosed extends LoginState {}
