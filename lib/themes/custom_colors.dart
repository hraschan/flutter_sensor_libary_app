import 'package:flutter/material.dart';

const PrimaryColor = Color(0xFFc51d64);
const PrimaryColorLight = Color(0xFFfc5a91);
const PrimaryColorDark = Color(0xFF8f003a);

const SecondaryColor = Color(0xFF636060);
const SecondaryColorLight = Color(0xFF908d8d);
const SecondaryColorDark = Color(0xFF393636);

const White = Color(0xFFFFFFFF);
const AccentWhite = Color(0xFFF2F2F2);
const Background = Color(0xFFE5E5E5);
const TextColor = Color(0xFF000000);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
