import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class AppDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return divider();
  }
  Widget divider() {
    return Padding(
      padding:  EdgeInsets.only(top: SizeConfig.padding, bottom: SizeConfig.padding),
      child: Divider(
        height: 1,
        thickness: 1,
        color: AppColors.greyColor.withOpacity(.5),
      ),
    );
  }
}
