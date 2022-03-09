import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/text_theme.dart';

ThemeData appTheme = ThemeData.light().copyWith(
    textTheme: appTextTheme,
    colorScheme: appColorScheme,
    scaffoldBackgroundColor: backgroundColor,
    backgroundColor: backgroundColor);

ColorScheme appColorScheme =
    const ColorScheme.light(background: backgroundColor, primary: primaryColor);
