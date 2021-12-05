import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';

import 'app_label_with_icon.dart';

class AppContainerWithLabel extends StatelessWidget {
  final Color borderColor;
  final Widget child;
  final String label;
  final double? width;
  final EdgeInsetsGeometry? padding;
  const AppContainerWithLabel(
      {Key? key,
      required this.borderColor,
      required this.label,
      required this.child,
      this.width,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: borderColor),
              borderRadius:
                  BorderRadius.all(Radius.circular(SizeConfig.btnRadius))),
          padding: padding??EdgeInsets.all(SizeConfig.padding / 2),
          child: child,
        ),
        Positioned(
          top: -10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding + 3),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              color: AppColors.blackBGColor,
              child: AppLabelWithIcon(
                icon: Icon(
                  Icons.star,
                  color: AppColors.accentColor,
                  size: (SizeConfig.iconSize / 3) - 2,
                ),
                label:label,
                labelColor: AppColors.greyLightColor,
                fontSize: SizeConfig.smallTextFontSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
