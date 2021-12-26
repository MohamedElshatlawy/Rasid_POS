import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_label_with_icon.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/utilities.dart';

import '../../../common/widgets/title_and_description.dart';

class ChangeLanguageView extends BaseStatefulWidget {
  @override
  _ChangeLanguageViewtate createState() => _ChangeLanguageViewtate();
}

class _ChangeLanguageViewtate extends BaseState<ChangeLanguageView> {
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
              label: AppLocalizations.of(context).changeLanguage,
              descriptionLabel: ''),
          SizedBox(height: SizeConfig.blockSizeVertical * 7),
          AppButton(
              title: AppLocalizations.of(context).arabicLanguage,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.WHITH_COLOR),
              borderColor: AppColors.LIST_ITEM_COLOR,
              backgroundColor: AppColors.LIST_ITEM_COLOR,
              width: SizeConfig.blockSizeHorizontal * 100,
              icon: Icon(Icons.check),
              alignment: AppButtonAlign.EXPANDED,
              onTap: () {}),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          AppButton(
              title: AppLocalizations.of(context).englishLanguage,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.WHITH_COLOR),
              borderColor: AppColors.LIST_ITEM_COLOR,
              backgroundColor: AppColors.LIST_ITEM_COLOR,
              width: SizeConfig.blockSizeHorizontal * 100,
              alignment: AppButtonAlign.EXPANDED,
              onTap: () {}),
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

  @override
  Widget? getBottomNavigationBar() {
    // TODO: implement getBottomNavigationBar
    return Container(
      padding: EdgeInsets.all(SizeConfig.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
              title: AppLocalizations.of(context).change,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.WHITH_COLOR),
              borderColor: AppColors.accentColor,
              backgroundColor: AppColors.accentColor,
              width: SizeConfig.blockSizeHorizontal * 100,
              onTap: () {}),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          AppButton(
              title: AppLocalizations.of(context).cancel,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.accentColor),
              borderColor: AppColors.transparentColor,
              backgroundColor: AppColors.transparentColor,
              height: SizeConfig.btnHeight / 4 * 3,
              width: SizeConfig.blockSizeHorizontal * 100,
              onTap: () => super.onWillPop()),
        ],
      ),
    );
  }
}
