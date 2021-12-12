import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class AppText extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final TextAlign? textAlign;

  AppText({required this.label, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: style ??
          AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.textFontSize,
              fontColor: AppColors.fontColor),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
