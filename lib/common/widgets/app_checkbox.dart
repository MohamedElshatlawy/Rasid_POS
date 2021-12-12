import 'package:flutter/material.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final Widget title;
  final TextStyle? style;
  final Color? borderColor;
  final Color? fillColor;
  final Color activeColor;
  final Color? fontColor;
  final bool isRequired;
  final GestureTapCallback onTap;

  AppCheckbox(
      {required this.value,
      required this.title,
      this.style,
      this.borderColor,
      this.fillColor,
      required this.activeColor,
      this.fontColor,
      required this.isRequired,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: SizeConfig.iconSize,
                height: SizeConfig.iconSize,
                decoration: BoxDecoration(
                    color: fillColor,
                    border: Border.all(
                        width: 2, color: borderColor ?? AppColors.greyColor),
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.btnRadius / 2))),
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal),
                child: Center(
                    child: value
                        ? Container(
                            width: SizeConfig.iconSize,
                            height: SizeConfig.iconSize,
                            decoration: BoxDecoration(
                                color: activeColor,
                                border:
                                    Border.all(width: 2, color: activeColor),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    SizeConfig.safeBlockHorizontal / 3))),
                          )
                        : SizedBox()),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 1),
              if (isRequired)
                Icon(
                  Icons.star,
                  size: SizeConfig.iconSize / 2,
                  color: activeColor,
                ),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
              title
            ],
          ),
          if (!value)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
              child: AppText(
                label:
                    '${AppLocalizations.of(context).youHaveToAcceptTermsAndConditions}',
                style: style ??
                    AppFontStyle.bahijSansArabic(
                        fontSize: SizeConfig.smallTextFontSize,
                        fontColor: AppColors.redColor),
              ),
            )
        ],
      ),
    );
  }
}
