import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';

class AddHabitAction extends StatelessWidget {
  final String title;
  final String action;
  final void Function()? onPressed;
  final EdgeInsets? padding;

  const AddHabitAction(
      {Key? key,
      required this.title,
      required this.action,
      this.onPressed,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primary = Theme.of(context).colorScheme.primary;

    return Container(
        padding: padding ??
            EdgeInsets.symmetric(
                horizontal: kDefaultHorizontalPaddingMedium.left, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: textTheme.bodyText2),
            TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      action,
                      style: textTheme.headline4?.copyWith(color: primary),
                    ),
                    Icon(Icons.chevron_right_rounded, color: primary)
                  ],
                ))
          ],
        ));
  }
}
