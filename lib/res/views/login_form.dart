import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/app_form_field.dart';
import 'package:habit_builder_demo/res/views/primary_text_button.dart';

class LoginPageForm extends StatefulWidget {
  final void Function()? onForgotPassword;
  final void Function()? onSignUp;
  final void Function(String, String)? onLogin;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;

  const LoginPageForm(
      {Key? key,
      this.onForgotPassword,
      this.onSignUp,
      this.onLogin,
      this.emailValidator,
      this.passwordValidator})
      : super(key: key);

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('Log in with email', style: textTheme.bodyText2),
          ),
          Divider(color: colorScheme.background),
          AppFormField(
              icon: Icons.email_outlined,
              hint: 'Email',
              validator: widget.emailValidator,
              controller: _emailController,
              backgroundColor: colorScheme.background,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 8),
          AppFormField(
              icon: Icons.lock_outline,
              hint: 'Password',
              validator: widget.passwordValidator,
              controller: _passwordController,
              backgroundColor: colorScheme.background,
              isPassword: true),
          const SizedBox(height: 20),
          PrimaryTextButton(
              text: 'Login',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onLogin
                      ?.call(_emailController.text, _passwordController.text);
                }
              }),
          const SizedBox(height: 16),
          _LoginFormFooter(
              onForgotPassword: widget.onForgotPassword,
              onSignUp: widget.onSignUp)
        ]),
      ),
    );
  }
}

class _LoginFormFooter extends StatelessWidget {
  final void Function()? onForgotPassword;
  final void Function()? onSignUp;

  const _LoginFormFooter({Key? key, this.onForgotPassword, this.onSignUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;
    final ButtonStyle textButtonStyle = TextButton.styleFrom(
        padding: const EdgeInsets.all(4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap);

    return Padding(
      padding: kDefaultHorizontalPaddingMedium,
      child: Column(
        children: [
          TextButton(
            onPressed: onForgotPassword,
            style: textButtonStyle,
            child: Text('Forgot Password?',
                style:
                    textStyle?.copyWith(decoration: TextDecoration.underline)),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Don't have an account? ", style: textStyle),
              TextButton(
                onPressed: onSignUp,
                style: textButtonStyle,
                child: Text('Sign up',
                    style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
              )
            ],
          ),
          const SizedBox(height: 28)
        ],
      ),
    );
  }
}
