part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSendResult extends ResetPasswordState {
  final bool result;

  const ResetPasswordSendResult(this.result);

  @override
  List<Object> get props => [result];
}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  const ResetPasswordError(this.message);

  @override
  List<Object> get props => [message];
}
