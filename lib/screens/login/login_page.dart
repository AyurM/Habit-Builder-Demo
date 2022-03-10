import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/help_dialog.dart';
import 'package:habit_builder_demo/res/views/icon_text_button.dart';
import 'package:habit_builder_demo/res/views/login_form.dart';
import 'package:habit_builder_demo/screens/login/login_cubit.dart';
import 'package:habit_builder_demo/screens/reset_password/reset_password_page.dart';
import 'package:habit_builder_demo/screens/sign_up/sign_up_page.dart';
import 'package:habit_builder_demo/utils/snackbar_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginCubit, LoginState> {
  @override
  Widget builder(BuildContext context, LoginState state) =>
      Scaffold(body: _buildScaffoldBody(state));

  Widget _buildScaffoldBody(LoginState state) {
    if (state is LoginLoading) {
      return Center(
          child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary));
    }

    return Stack(alignment: Alignment.center, children: [
      const _LoginPageBackground(),
      SingleChildScrollView(
        child: _LoginPageForeground(
          onLoginWithGoogle: cubit.onLoginWithGoogle,
          onLoginWithFacebook: cubit.onLoginWithFacebook,
          onLogin: cubit.onLogin,
          onSignUp: cubit.onSignUp,
          onForgotPassword: cubit.onForgotPassword,
          emailValidator: cubit.emailValidator,
          passwordValidator: cubit.passwordValidator,
        ),
      ),
      _LoginPageHelpButton(onPressed: cubit.onHelpButtonPressed),
    ]);
  }

  @override
  Future<void> listener(BuildContext context, LoginState state) async {
    if (state is LoginContinueWithGoogle) {
      context.showSnackBar(state.profile.toString(), clear: true);
    }

    if (state is LoginContinueWithFacebook) {
      context.showSnackBar(state.profile.toString(), clear: true);
    }

    if (state is LoginHelpButtonPressed) {
      showDialog(
          context: context,
          builder: (context) => HelpDialog(onClose: cubit.onHelpDialogClosed));
    }

    if (state is LoginForgotPassword) {
      await Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResetPasswordPage()));
      cubit.onResetPasswordPageClosed();
    }

    if (state is LoginSignUp) {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUpPage()));
      cubit.onSignUpPageClosed();
    }

    if (state is LoginSuccessful) {
      context.showSnackBar(state.profile.toString(), clear: true);
    }

    if (state is LoginError) {
      context.showSnackBar('Error: ${state.message}', clear: true);
    }
  }
}

class _LoginPageBackground extends StatelessWidget {
  const _LoginPageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      left: 0,
      right: 0,
      top: size.height * -0.25,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Image.asset('assets/images/splash_screen.png',
            width: double.infinity, height: double.infinity, fit: BoxFit.cover),
      ),
    );
  }
}

class _LoginPageHelpButton extends StatelessWidget {
  final void Function()? onPressed;
  final double size;

  const _LoginPageHelpButton({Key? key, this.onPressed, this.size = 44})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
        top: 48,
        right: 24,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              minimumSize: Size(size, size),
              backgroundColor: eclipse.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size / 2))),
          child: Text('?', style: Theme.of(context).textTheme.headline1),
        ),
      );
}

class _LoginPageForeground extends StatelessWidget {
  final void Function()? onLoginWithGoogle;
  final void Function()? onLoginWithFacebook;
  final void Function()? onForgotPassword;
  final void Function()? onSignUp;
  final void Function(String, String)? onLogin;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;

  const _LoginPageForeground({
    Key? key,
    this.onLoginWithGoogle,
    this.onLoginWithFacebook,
    this.onForgotPassword,
    this.onSignUp,
    this.onLogin,
    this.emailValidator,
    this.passwordValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            colorScheme.background.withOpacity(0),
            colorScheme.background
          ],
              stops: const [
            0,
            0.4
          ])),
      child: Column(children: [
        const Expanded(child: SizedBox()),
        Padding(
          padding: kDefaultHorizontalPaddingMedium,
          child: Text('Welcome to Monumental Habits',
              style: textTheme.headline1, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 40),
        IconTextButton(
            onPressed: onLoginWithGoogle,
            iconPath: 'assets/images/google.png',
            text: 'Continue with Google'),
        const SizedBox(height: 8),
        IconTextButton(
            onPressed: onLoginWithFacebook,
            iconPath: 'assets/images/facebook.png',
            text: 'Continue with Facebook'),
        const SizedBox(height: 24),
        LoginPageForm(
            onForgotPassword: onForgotPassword,
            onSignUp: onSignUp,
            onLogin: onLogin,
            emailValidator: emailValidator,
            passwordValidator: passwordValidator)
      ]),
    );
  }
}
