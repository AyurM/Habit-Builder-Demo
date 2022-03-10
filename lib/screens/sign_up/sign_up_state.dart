part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  final String message;

  const SignUpError(this.message);

  @override
  List<Object> get props => [message];
}

class SignUpContinueWithGoogle extends SignUpState {
  final UserProfile profile;

  const SignUpContinueWithGoogle(this.profile);

  @override
  List<Object> get props => [profile];
}

class SignUpContinueWithFacebook extends SignUpState {
  final UserProfile profile;

  const SignUpContinueWithFacebook(this.profile);

  @override
  List<Object> get props => [profile];
}

class SignUpCreatedAccount extends SignUpState {
  final SignUpData signUpData;

  const SignUpCreatedAccount(this.signUpData);

  @override
  List<Object> get props => [signUpData];
}
