import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';

class AppFormField extends StatefulWidget {
  final IconData? icon;
  final String hint;
  final Color? backgroundColor;
  final EdgeInsets margin;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  const AppFormField(
      {Key? key,
      this.icon,
      required this.hint,
      this.backgroundColor,
      this.margin = kDefaultHorizontalPaddingMedium,
      this.keyboardType,
      this.controller,
      this.isPassword = false,
      this.validator})
      : super(key: key);

  @override
  State<AppFormField> createState() =>
      _AppFormFieldState(isPassword: isPassword);
}

class _AppFormFieldState extends State<AppFormField> {
  _AppFormFieldState({required bool isPassword})
      : isObscured = isPassword,
        isFocused = false,
        focusNode = FocusNode();

  bool isObscured;
  bool isFocused;
  final FocusNode focusNode;

  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color hintColor = eclipse.withOpacity(0.5);

    return Padding(
      padding: widget.margin,
      child: TextFormField(
        validator: widget.validator,
        focusNode: focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: isObscured,
        style: textTheme.button?.copyWith(color: colorScheme.primary),
        decoration: InputDecoration(
            prefixIcon: widget.icon == null
                ? null
                : _AppFormFieldIcon(
                    iconData: widget.icon!,
                    color: isFocused ? colorScheme.primary : hintColor),
            suffixIcon: widget.isPassword ? _passwordVisibilityButton() : null,
            filled: true,
            fillColor: widget.backgroundColor ?? Colors.white,
            hintStyle: textTheme.bodyText2?.copyWith(color: hintColor),
            hintText: widget.hint,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none)),
      ),
    );
  }

  Widget _passwordVisibilityButton() => TextButton(
        onPressed: () {
          setState(() {
            isObscured = !isObscured;
          });
        },
        child: Text(isObscured ? 'Show' : 'Hide',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(decoration: TextDecoration.underline)),
      );
}

class _AppFormFieldIcon extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final double spacing;
  final Size size;

  const _AppFormFieldIcon(
      {Key? key,
      required this.iconData,
      required this.color,
      this.spacing = 16.0,
      this.size = const Size(48, 56)})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        color: Theme.of(context).colorScheme.background))),
            child: Icon(iconData, color: color),
          ),
          SizedBox(
            width: spacing,
          )
        ],
      );
}
