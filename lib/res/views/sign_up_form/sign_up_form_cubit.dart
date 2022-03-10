import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/sign_up_data.dart';
import 'package:habit_builder_demo/utils/validation/form_validators.dart';

part 'sign_up_form_state.dart';

class SignUpFormCubit extends Cubit<SignUpFormState> {
  SignUpFormCubit() : super(SignUpFormInitial());

  String? Function(String?) get usernameValidator =>
      FormValidator.usernameValidator;

  String? Function(String?) get emailValidator => FormValidator.emailValidator;

  String? Function(String?) get passwordValidator =>
      FormValidator.passwordValidator;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  bool _keepSignedIn = true;
  bool get keepSignedIn => _keepSignedIn;

  bool _receiveEmails = true;
  bool get receiveEmails => _receiveEmails;

  SignUpData get signUpData => SignUpData(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      keepSignedIn: _keepSignedIn,
      receiveEmails: _receiveEmails);

  void onKeepSignedInChanged(bool? value) {
    _keepSignedIn = value!;
  }

  void onReceiveEmailsChanged(bool? value) {
    _receiveEmails = value!;
  }
}
