import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/app_form_field.dart';
import 'package:habit_builder_demo/res/views/app_icon_button.dart';
import 'package:habit_builder_demo/res/views/primary_text_button.dart';
import 'package:habit_builder_demo/screens/reset_password/reset_password_cubit.dart';
import 'package:habit_builder_demo/utils/snackbar_utils.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends BaseState<ResetPasswordPage,
    ResetPasswordCubit, ResetPasswordState> {
  @override
  Widget builder(BuildContext context, ResetPasswordState state) =>
      Scaffold(body: _buildScaffoldBody(state));

  Widget _buildScaffoldBody(ResetPasswordState state) {
    if (state is ResetPasswordLoading) {
      return Center(
          child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary));
    }

    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
          height: height,
          child: Column(children: [
            const _ResetPasswordPageBackButton(),
            const Expanded(child: _ResetPasswordPageHeader()),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, height * 0.11),
              child: _ResetPasswordForm(
                  emailValidator: cubit.emailValidator,
                  onSubmit: cubit.onSendResetLink),
            ),
            const _ResetPasswordPageFooter(),
            const SizedBox(height: 28)
          ])),
    );
  }

  @override
  void listener(BuildContext context, ResetPasswordState state) {
    if (state is ResetPasswordSendResult) {
      context.showSnackBar(
          state.result
              ? 'Reset link has been sent to your email'
              : 'Email not found',
          clear: true);
    }

    if (state is ResetPasswordError) {
      context.showSnackBar('Error: ${state.message}', clear: true);
    }
  }
}

class _ResetPasswordPageBackButton extends StatelessWidget {
  final double size;

  const _ResetPasswordPageBackButton({Key? key, this.size = 44.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 48),
            child: AppIconButton(
                size: size,
                iconData: Icons.arrow_back,
                onPressed: () => Navigator.pop(context))));
  }
}

class _ResetPasswordPageHeader extends StatelessWidget {
  const _ResetPasswordPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 36, 32, 8),
          child: Text('Forgot your password?',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Image.asset('assets/images/reset_password.png'),
          ),
        )
      ]);
}

class _ResetPasswordForm extends StatefulWidget {
  final void Function(String)? onSubmit;
  final String? Function(String?)? emailValidator;

  const _ResetPasswordForm({Key? key, this.onSubmit, this.emailValidator})
      : super(key: key);

  @override
  State<_ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<_ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: kDefaultHorizontalPaddingMedium,
            child: Text(
                'Enter your registered email below to receive password reset instruction',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 30),
          AppFormField(
              hint: 'Email',
              validator: widget.emailValidator,
              controller: _emailController,
              margin: EdgeInsets.zero,
              backgroundColor: Theme.of(context).colorScheme.background),
          const SizedBox(height: 16),
          PrimaryTextButton(
              text: 'Send Reset Link',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit?.call(_emailController.text);
                }
              },
              margin: EdgeInsets.zero)
        ]),
      ),
    );
  }
}

class _ResetPasswordPageFooter extends StatelessWidget {
  final EdgeInsets? margin;

  const _ResetPasswordPageFooter({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;

    return Padding(
      padding: margin ?? kDefaultHorizontalPaddingMedium,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Remember password? ", style: textStyle),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text('Login',
                style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
