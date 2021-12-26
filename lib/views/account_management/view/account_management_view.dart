import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_label_with_icon.dart';
import 'package:rasid_jack/common/widgets/app_web_view.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/utilities.dart';
import 'package:rasid_jack/views/auth/view/change_password_view.dart';
import 'package:rasid_jack/views/change_language/view/change_language_view.dart';

class AccountManagementView extends BaseStatefulWidget {
  @override
  _AccountManagementViewState createState() => _AccountManagementViewState();
}

class _AccountManagementViewState extends BaseState<AccountManagementView> {
  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            SizedBox(height: SizeConfig.blockSizeVertical * 8),
            AppButton(
                title:
                    '${AppLocalizations.of(context).change} ${AppLocalizations.of(context).password}',
                style: AppFontStyle.bahijSansArabic(
                    fontSize: SizeConfig.textFontSize,
                    fontColor: AppColors.WHITH_COLOR),
                borderColor: AppColors.LIST_ITEM_COLOR,
                backgroundColor: AppColors.LIST_ITEM_COLOR,
                width: SizeConfig.blockSizeHorizontal * 100,
                icon: AppImage(
                  path: AppAssets.OPERATIONS,
                  width: SizeConfig.iconSize,
                ),
                alignment: AppButtonAlign.START,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordView()))),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),
            AppButton(
                title: AppLocalizations.of(context).changeLanguage,
                style: AppFontStyle.bahijSansArabic(
                    fontSize: SizeConfig.textFontSize,
                    fontColor: AppColors.WHITH_COLOR),
                borderColor: AppColors.LIST_ITEM_COLOR,
                backgroundColor: AppColors.LIST_ITEM_COLOR,
                width: SizeConfig.blockSizeHorizontal * 100,
                icon: AppImage(
                  path: AppAssets.OPERATIONS,
                  width: SizeConfig.iconSize,
                ),
                alignment: AppButtonAlign.START,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeLanguageView()))),
          ],
        ),
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
      padding: EdgeInsets.only(
          left: SizeConfig.padding,
          top: SizeConfig.padding,
          right: SizeConfig.padding,
          bottom: SizeConfig.padding),
      child: AppButton(
          title: AppLocalizations.of(context).back,
          style: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.textFontSize,
              fontColor: AppColors.whiteColor),
          borderColor: AppColors.accentColor,
          backgroundColor: AppColors.accentColor,
          width: SizeConfig.blockSizeHorizontal * 100,
          onTap: onWillPop),
    );
  }
}
