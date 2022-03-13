import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/app_icon_button.dart';

class HabitAppBar extends AppBar {
  final String text;
  final IconData leadingIcon;
  final void Function()? onLeadingPressed;
  final Widget? trailing;
  final BuildContext context;

  HabitAppBar(
      {required this.context,
      required this.text,
      required this.leadingIcon,
      this.onLeadingPressed,
      this.trailing})
      : super(
          toolbarHeight: kDefaultAppBarHeight,
          leading: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultHorizontalPaddingMedium.left,
                vertical: (kDefaultAppBarHeight - kDefaultIconButtonSize) / 2),
            child: AppIconButton(
                iconData: leadingIcon, onPressed: onLeadingPressed),
          ),
          title: Text(text),
          actions: trailing == null ? null : [trailing],
        );

  @override
  bool? get centerTitle => true;

  @override
  double? get leadingWidth =>
      kDefaultIconButtonSize +
      kDefaultHorizontalPaddingMedium.left +
      kDefaultHorizontalPaddingMedium.right;

  @override
  Color? get backgroundColor => Theme.of(context).colorScheme.background;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  TextStyle? get titleTextStyle => Theme.of(context).textTheme.headline3;
}
