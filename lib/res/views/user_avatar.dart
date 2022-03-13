import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final void Function()? onPressed;

  const UserAvatar(
      {Key? key,
      required this.imageUrl,
      required this.radius,
      this.onPressed,
      this.margin,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: margin ?? kDefaultHorizontalPaddingMedium,
          child: CircleAvatar(
              radius: radius,
              backgroundColor:
                  backgroundColor ?? Theme.of(context).colorScheme.background,
              backgroundImage: NetworkImage(imageUrl)),
        ),
      );
}
