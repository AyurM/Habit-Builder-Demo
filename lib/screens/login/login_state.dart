part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}

class LoginContinueWithGoogle extends LoginState {
  final UserProfile profile;

  const LoginContinueWithGoogle(this.profile);

  @override
  List<Object> get props => [profile];
}

class LoginContinueWithFacebook extends LoginState {
  final UserProfile profile;

  const LoginContinueWithFacebook(this.profile);

  @override
  List<Object> get props => [profile];
}

class LoginHelpButtonPressed extends LoginState {}

class LoginHelpDialogClosed extends LoginState {}

class LoginForgotPassword extends LoginState {
  final String message;

  const LoginForgotPassword(this.message);

  @override
  List<Object> get props => [message];
}

class LoginSignUp extends LoginState {
  final String message;

  const LoginSignUp(this.message);

  @override
  List<Object> get props => [message];
}

class LoginSuccessful extends LoginState {
  final UserProfile profile;

  const LoginSuccessful(this.profile);

  @override
  List<Object> get props => [profile];
}
