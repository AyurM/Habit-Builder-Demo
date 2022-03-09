import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';

class PrimaryTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double borderRadius;
  final Size size;
  final Color? color;

  const PrimaryTextButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.borderRadius = 8.0,
      this.size = const Size(double.infinity, kDefaultButtonHeight),
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: kDefaultHorizontalPadding,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: onPressed == null
                  ? null
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
              primary: color ?? Theme.of(context).colorScheme.primary,
              minimumSize: size),
          onPressed: onPressed,
          child: Text(text, style: Theme.of(context).textTheme.button),
        ),
      );
}
