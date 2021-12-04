import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/size_config.dart';

import 'app_text.dart';

class AppRadioButton extends StatelessWidget {
  final Color activeColor;
  final GestureTapCallback onTap;
  final String label;
  final double labelFontSize;
  final Color labelFontColor;
  final bool isSelected;

  const AppRadioButton(
      {Key? key,
      required this.activeColor,
      required this.onTap,
      required this.label,
      required this.labelFontSize,
      required this.labelFontColor,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.padding / 2),
        child: Row(
          children: [
            Container(
              width: SizeConfig.iconSize,
              height: SizeConfig.iconSize,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                  shape: BoxShape.circle),
              padding: EdgeInsets.all(SizeConfig.padding / 4),
              child: Container(
                  width: SizeConfig.smallIconSize,
                  height: SizeConfig.smallIconSize,
                  decoration: BoxDecoration(
                      color: isSelected ? activeColor : AppColors.whiteColor,
                      shape: BoxShape.circle)),
            ),
            SizedBox(width: SizeConfig.blockSizeVertical * 2),
            Expanded(
              child: AppText(
                label: label,
                style: AppFontStyle.bahijLight(
                    fontSize: labelFontSize, fontColor: labelFontColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
