import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';

TextTheme appTextTheme = TextTheme(
    headline1: const TextStyle(
        fontFamily: "Klasik",
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: eclipse),
    headline2: const TextStyle(
        fontFamily: "Klasik",
        fontSize: 23,
        fontWeight: FontWeight.w400,
        color: eclipse),
    headline3: GoogleFonts.manrope(
        fontSize: 17, fontWeight: FontWeight.bold, color: eclipse),
    headline4: GoogleFonts.manrope(
        fontSize: 16, fontWeight: FontWeight.bold, color: eclipse),
    headline5: const TextStyle(
        fontFamily: "Klasik",
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: eclipse),
    bodyText1: GoogleFonts.manrope(
        fontSize: 13, fontWeight: FontWeight.w500, color: eclipse),
    bodyText2: GoogleFonts.manrope(
        fontSize: 15, fontWeight: FontWeight.w400, color: eclipse),
    button: GoogleFonts.manrope(
        fontSize: 15, fontWeight: FontWeight.bold, color: eclipse),
    subtitle1: GoogleFonts.manrope(
        fontSize: 11, fontWeight: FontWeight.bold, color: eclipse),
    subtitle2: GoogleFonts.manrope(
        fontSize: 10, fontWeight: FontWeight.bold, color: eclipse));
