import 'package:flutter/material.dart';

class AppFontStyle {
  static TextStyle cairoRegular(double fontSize, Color fontColor) => TextStyle(
      fontFamily: 'CairoRegular', fontSize: fontSize, color: fontColor);

  static TextStyle cairoBold(double fontSize, Color fontColor) =>
      TextStyle(fontFamily: 'CairoBold', fontSize: fontSize, color: fontColor);

  static TextStyle cairoLight(double fontSize, Color fontColor) =>
      TextStyle(fontFamily: 'CairoLight', fontSize: fontSize, color: fontColor);

  static TextStyle cairoSemiBold(double fontSize, Color fontColor) => TextStyle(
      fontFamily: 'CairoSemiBold', fontSize: fontSize, color: fontColor);

  static TextStyle latoBlack(double fontSize, Color fontColor) =>
      TextStyle(fontFamily: 'LatoBlack', fontSize: fontSize, color: fontColor);

  static TextStyle latoBold(double fontSize, Color fontColor) =>
      TextStyle(fontFamily: 'LatoBold', fontSize: fontSize, color: fontColor);

  static TextStyle latoSemiBold(double fontSize, Color fontColor) => TextStyle(
      fontFamily: 'LatoSemiBold', fontSize: fontSize, color: fontColor);

  static TextStyle latoRegular(double fontSize, Color fontColor) => TextStyle(
      fontFamily: 'LatoRegular', fontSize: fontSize, color: fontColor);
}
