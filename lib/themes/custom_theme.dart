// ignore_for_file: constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'custom_colors.dart';

const FontFamily = 'Roboto';

class MyTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primarySwatch: createMaterialColor(PrimaryColor),
        accentColor: SecondaryColor,
        accentColorBrightness: Brightness.dark,
        primaryColor: PrimaryColor,
        primaryColorDark: PrimaryColorDark,
        primaryColorLight: PrimaryColorLight,
        primaryColorBrightness: Brightness.dark,
        scaffoldBackgroundColor: Background,
        cardColor: Background,
        textSelectionColor: PrimaryColorLight,
        backgroundColor: Background,
        indicatorColor: createMaterialColor(PrimaryColor),
        fontFamily: FontFamily,
        textTheme: const TextTheme(
                headline1: TextStyle(
                    fontSize: 96,
                    letterSpacing: -1.5,
                    fontWeight: FontWeight.normal),
                headline2: TextStyle(
                    fontSize: 60,
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.normal),
                headline3: TextStyle(
                    fontSize: 46,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal),
                headline4: TextStyle(
                    fontSize: 34,
                    letterSpacing: 0.25,
                    fontWeight: FontWeight.normal),
                headline5: TextStyle(
                    fontSize: 24,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal),
                headline6: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.normal),
                bodyText1: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.normal),
                bodyText2: TextStyle(
                    fontSize: 14,
                    letterSpacing: 0.25,
                    fontWeight: FontWeight.normal))
            .apply(bodyColor: TextColor),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: PrimaryColor,
        ));
  }
}
