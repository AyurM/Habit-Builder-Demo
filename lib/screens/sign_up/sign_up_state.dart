part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

abstract class SignUpSuccess extends SignUpState {
  final UserProfile profile;

  const SignUpSuccess(this.profile);

  @override
  List<Object> get props => [profile];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  final String message;

  const SignUpError(this.message);

  @override
  List<Object> get props => [message];
}

class SignUpContinueWithGoogle extends SignUpSuccess {
  const SignUpContinueWithGoogle(UserProfile profile) : super(profile);
}

class SignUpContinueWithFacebook extends SignUpSuccess {
  const SignUpContinueWithFacebook(UserProfile profile) : super(profile);
}

class SignUpCreatedAccount extends SignUpSuccess {
  const SignUpCreatedAccount(UserProfile profile) : super(profile);
}
