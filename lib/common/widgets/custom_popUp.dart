import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class CustomPopUp extends StatelessWidget {
  final Widget? contentPopUp;
  final EdgeInsetsGeometry? margin;
  CustomPopUp({Key? key, this.contentPopUp, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.padding, vertical: SizeConfig.padding),
      margin: margin ?? EdgeInsets.symmetric(vertical: SizeConfig.btnHeight),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.borderRaduis),
          color: AppColors.DARK_GRAY_COLOR),
      child: contentPopUp,
    );
  }
}
