import 'package:flutter/material.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class AppLabelWithIcon extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Widget icon;
  final double? fontSize;

  const AppLabelWithIcon(
      {Key? key,
      required this.label,
      required this.labelColor,
      required this.icon,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        SizedBox(width: SizeConfig.padding / 2),
        AppText(
          label: label,
          style: AppFontStyle.bahijSansArabic(
              fontSize: fontSize ?? SizeConfig.textFontSize,
              fontColor: labelColor),
        )
      ],
    );
  }
}
