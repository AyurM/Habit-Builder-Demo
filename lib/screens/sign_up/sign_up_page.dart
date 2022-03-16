import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/app_loading_indicator.dart';
import 'package:habit_builder_demo/res/views/icon_text_button.dart';
import 'package:habit_builder_demo/res/views/sign_up_form/sign_up_form.dart';
import 'package:habit_builder_demo/screens/sign_up/sign_up_cubit.dart';
import 'package:habit_builder_demo/utils/snackbar_utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BaseState<SignUpPage, SignUpCubit, SignUpState> {
  @override
  Widget builder(BuildContext context, SignUpState state) =>
      Scaffold(body: _buildScaffoldBody(state));

  Widget _buildScaffoldBody(SignUpState state) {
    if (state is SignUpLoading || state is SignUpSuccess) {
      return const AppLoadingIndicator();
    }
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const Expanded(
              child: _SignUpPageHeader(),
            ),
            const SizedBox(height: 36),
            SignUpForm(onSignUp: cubit.onCreateAccount),
            const SizedBox(height: 16),
            const _SignUpDivider(),
            const SizedBox(height: 20),
            _SignUpPageAuthOptions(
                onLoginWithGoogle: cubit.onLoginWithGoogle,
                onLoginWithFacebook: cubit.onLoginWithFacebook),
            const SizedBox(height: 20),
            const _SignUpPageFooter(),
            const SizedBox(height: 28)
          ],
        ),
      ),
    );
  }

  @override
  void listener(BuildContext context, SignUpState state) {
    if (state is SignUpSuccess) {
      Navigator.pop(context, state.profile);
    }

    if (state is SignUpError) {
      context.showSnackBar('Error: ${state.message}', clear: true);
    }
  }
}

class _SignUpPageHeader extends StatelessWidget {
  const _SignUpPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 48, 32, 20),
            child: Image.asset('assets/images/create_account.png'),
          ),
        ),
        Text('Create your account',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center),
      ]);
}

class _SignUpDivider extends StatelessWidget {
  final EdgeInsets? margin;

  const _SignUpDivider({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = eclipse.withOpacity(0.5);
    final Widget divider = Expanded(child: Divider(color: color));

    return Padding(
      padding: margin ?? kDefaultHorizontalPaddingMedium,
      child: Row(children: [
        divider,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('Or sign in with',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: color)),
        ),
        divider
      ]),
    );
  }
}

class _SignUpPageAuthOptions extends StatelessWidget {
  final void Function()? onLoginWithGoogle;
  final void Function()? onLoginWithFacebook;
  final EdgeInsets? margin;

  const _SignUpPageAuthOptions(
      {Key? key, this.onLoginWithGoogle, this.onLoginWithFacebook, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const EdgeInsets buttonMargin = EdgeInsets.zero;
    const double iconSpacing = 8;

    return Padding(
      padding: margin ?? kDefaultHorizontalPaddingMedium,
      child: Row(children: [
        Expanded(
          child: IconTextButton(
              margin: buttonMargin,
              onPressed: onLoginWithGoogle,
              iconPath: 'assets/images/google.png',
              iconSpacing: iconSpacing,
              text: 'Google'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: IconTextButton(
              margin: buttonMargin,
              onPressed: onLoginWithFacebook,
              iconPath: 'assets/images/facebook.png',
              iconSpacing: iconSpacing,
              text: 'Facebook'),
        )
      ]),
    );
  }
}

class _SignUpPageFooter extends StatelessWidget {
  final EdgeInsets? margin;

  const _SignUpPageFooter({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;

    return Padding(
      padding: margin ?? kDefaultHorizontalPaddingMedium,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Already have an account? ", style: textStyle),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text('Sign in',
                style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
