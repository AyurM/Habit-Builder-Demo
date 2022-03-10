import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/data/model/sign_up_data.dart';
import 'package:habit_builder_demo/res/views/app_form_field.dart';
import 'package:habit_builder_demo/res/views/checkbox_option.dart';
import 'package:habit_builder_demo/res/views/primary_text_button.dart';
import 'package:habit_builder_demo/res/views/sign_up_form/sign_up_form_cubit.dart';

const EdgeInsets _defaultCheckboxPadding = EdgeInsets.symmetric(horizontal: 40);

class SignUpForm extends StatefulWidget {
  final void Function(SignUpData)? onSignUp;

  const SignUpForm({Key? key, this.onSignUp}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState
    extends BaseState<SignUpForm, SignUpFormCubit, SignUpFormState> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget builder(BuildContext context, SignUpFormState state) {
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(children: [
          AppFormField(
              icon: Icons.person_outline_rounded,
              hint: 'Username',
              validator: cubit.usernameValidator,
              controller: cubit.usernameController,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 8),
          AppFormField(
              icon: Icons.email_outlined,
              hint: 'Email',
              validator: cubit.emailValidator,
              controller: cubit.emailController,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 8),
          AppFormField(
            icon: Icons.lock_outline,
            hint: 'Password',
            validator: cubit.passwordValidator,
            controller: cubit.passwordController,
            isPassword: true,
          ),
          const SizedBox(height: 20),
          Padding(
              padding: _defaultCheckboxPadding,
              child: CheckboxOption(
                label: 'Keep me signed in',
                initialValue: cubit.keepSignedIn,
                onChanged: cubit.onKeepSignedInChanged,
              )),
          const SizedBox(height: 12),
          Padding(
              padding: _defaultCheckboxPadding,
              child: CheckboxOption(
                label: 'Email me about special pricing and more',
                initialValue: cubit.receiveEmails,
                onChanged: cubit.onReceiveEmailsChanged,
              )),
          const SizedBox(height: 20),
          PrimaryTextButton(
              text: 'Create account',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSignUp?.call(cubit.signUpData);
                }
              })
        ]),
      ),
    );
  }
}
