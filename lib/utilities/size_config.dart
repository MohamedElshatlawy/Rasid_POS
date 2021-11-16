import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static double screenWidth = 500.0;
  static double screenHeight = 500.0;
  static double blockSizeHorizontal = 20.0;
  static double blockSizeVertical = 20.0;
  static double _safeAreaHorizontal = 20.0;
  static double _safeAreaVertical = 20.0;
  static double safeBlockHorizontal = 20.0;
  static double safeBlockVertical = 20.0;
  static double titleFontSize = 16.0;
  static double textFontSize = 14.0;
  static double smallTextFontSize = 12.0;
  static double iconSize = 20.0;
  static double smallIconSize = 15.0;
  static double btnHeight = 50.0;
  static double padding = 8.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    titleFontSize = SizeConfig.safeBlockHorizontal * 4.5;
    textFontSize = SizeConfig.safeBlockHorizontal * 3.25;
    smallTextFontSize = SizeConfig.safeBlockHorizontal * 2.25;
    iconSize = SizeConfig.safeBlockHorizontal * 6;
    smallIconSize = SizeConfig.safeBlockHorizontal * 4;
    btnHeight = SizeConfig.safeBlockHorizontal * 10;
    padding = SizeConfig.safeBlockHorizontal * 4;
  }
}
