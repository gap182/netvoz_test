import 'package:flutter/material.dart';
import 'package:netvoz_app/src/core/theme/colors.dart';

final themData = ThemeData(
  primaryColor: UiColors.primaryColor,
  colorScheme: const ColorScheme.light(
    primary: UiColors.primaryColor,
    secondary: UiColors.secondColor,
  ),
  fontFamily: "Lato",
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return UiColors.primaryColor;
          } else if (states.contains(MaterialState.disabled)) {
            return UiColors.lightGray;
          } else {
            return null;
          }
        },
      ),
    ),
  ),
);
