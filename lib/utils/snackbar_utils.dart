import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';

extension ContextExtensions on BuildContext {
  void showSnackBar(String text, {bool clear = false}) {
    if (clear) clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        backgroundColor: twilight,
        content: Text(text,
            style: Theme.of(this)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.white))));
  }

  void clearSnackBars() => ScaffoldMessenger.of(this).clearSnackBars();
}
