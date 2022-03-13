import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';

class AppIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  final double size;

  const AppIconButton(
      {Key? key,
      required this.iconData,
      this.onPressed,
      this.size = kDefaultIconButtonSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Ink(
        width: size,
        height: size,
        decoration: ShapeDecoration(
            shape: const CircleBorder(), color: eclipse.withOpacity(0.1)),
        child: IconButton(
            icon: Icon(iconData, color: eclipse), onPressed: onPressed),
      );
}
