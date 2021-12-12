import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';

import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';

import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';

import '../../../common/widgets/title_and_description.dart';

class VerifiedView extends BaseStatefulWidget {
  @override
  _VerifiedViewState createState() => _VerifiedViewState();
}

class _VerifiedViewState extends BaseState<VerifiedView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.blockSizeVertical * 8),
          Center(
              child: AppImage(
            path: AppAssets.LOGO,
            width: SizeConfig.blockSizeHorizontal * 40,
            // height: SizeConfig.blockSizeHorizontal * 20,
          )),
          SizedBox(height: SizeConfig.blockSizeVertical * 4),
          TitleAndDescription(
            label: AppLocalizations.of(context).correctly,
            descriptionLabel: '',
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          Center(
            child: AppText(
              label: AppLocalizations.of(context).correctly,
              style: AppFontStyle.bahijLight(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.WHITH_COLOR),
            ),
          ),
          Center(
            child: AppText(
              label: AppLocalizations.of(context).cancel,
              style: AppFontStyle.bahijLight(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.WHITH_COLOR),
            ),
          ),
          Expanded(
            child: Center(
              child: AppImage(
                path: AppAssets.bill,
                width: SizeConfig.blockSizeHorizontal * 45,
                // height: SizeConfig.blockSizeHorizontal * 20,
              ),
            ),
          ),
          Center(
            child: AppText(
              label: AppLocalizations.of(context).emailAddress,
              style: AppFontStyle.bahijLight(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.greyColor),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          AppButton(
              title: AppLocalizations.of(context).login,
              style: AppFontStyle.bahijSemiBold(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.WHITH_COLOR),
              borderColor: AppColors.accentColor,
              backgroundColor: AppColors.accentColor,
              width: SizeConfig.blockSizeHorizontal * 100,
              onTap: () {}),
          SizedBox(height: SizeConfig.blockSizeVertical * 12),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? getAppbar() {
    // TODO: implement getAppbar
    return null;
  }

  @override
  Color getScaffoldBackgroundColor() {
    // TODO: implement getScaffoldBackgroundColor
    return AppColors.blackBGColor;
  }
}
