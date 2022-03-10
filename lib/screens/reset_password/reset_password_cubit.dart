import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_builder_demo/data/repositories/auth_repository.dart';
import 'package:habit_builder_demo/utils/validation/form_validators.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(ResetPasswordInitial());

  final AuthRepository _authRepository;

  String? Function(String?) get emailValidator => FormValidator.emailValidator;

  Future<void> onSendResetLink(String email) async {
    emit(ResetPasswordLoading());
    try {
      final bool sendResult = await _authRepository.sendResetLink(email);
      emit(ResetPasswordSendResult(sendResult));
    } catch (error) {
      emit(ResetPasswordError(error.toString()));
    }
  }
}
