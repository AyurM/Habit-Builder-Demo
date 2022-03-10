import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';

class IconTextButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final void Function()? onPressed;
  final double borderRadius;
  final double iconSpacing;
  final Size size;
  final Color? color;
  final EdgeInsets margin;

  const IconTextButton(
      {Key? key,
      required this.text,
      required this.iconPath,
      this.onPressed,
      this.borderRadius = 12.0,
      this.iconSpacing = 16.0,
      this.size = const Size(double.infinity, kDefaultButtonHeight),
      this.color = Colors.white,
      this.margin = kDefaultHorizontalPaddingMedium})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: onPressed == null
              ? null
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius)),
          primary: color,
          minimumSize: size,
          alignment: Alignment.center,
        ),
        onPressed: onPressed,
        icon: Padding(
          padding: EdgeInsets.only(right: iconSpacing),
          child: Image.asset(iconPath, width: 23, height: 23),
        ),
        label: Text(text, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
