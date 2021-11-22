import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? AppColors.WHITH_COLOR,
        fontSize: fontSize ?? SizeConfig.textFontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
