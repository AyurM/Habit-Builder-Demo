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
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: eclipse),
    headline3: GoogleFonts.manrope(
        fontSize: 18, fontWeight: FontWeight.bold, color: eclipse),
    headline4: GoogleFonts.manrope(
        fontSize: 17, fontWeight: FontWeight.bold, color: eclipse),
    bodyText1: GoogleFonts.manrope(
        fontSize: 14, fontWeight: FontWeight.w500, color: eclipse),
    bodyText2: GoogleFonts.manrope(
        fontSize: 16, fontWeight: FontWeight.w400, color: eclipse),
    button: GoogleFonts.manrope(
        fontSize: 16, fontWeight: FontWeight.bold, color: eclipse));
