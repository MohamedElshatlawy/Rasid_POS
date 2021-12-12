import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rxdart/rxdart.dart';

class ChangePasswordView extends BaseStatefulWidget {
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends BaseState<ChangePasswordView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage(path: AppAssets.LOGO, height: SizeConfig.btnHeight * 1.5),
          SizedBox(height: SizeConfig.padding * 2),
          AppText(
              label: AppLocalizations.of(context).changePassword,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize * 1.5,
                  fontColor: AppColors.whiteColor)),
          AppText(
              label: AppLocalizations.of(context).forgetSubtitle,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize * 1.5,
                  fontColor: AppColors.greyColor)),
          SizedBox(height: SizeConfig.padding * 3),
          AppTextFormFieldItem(
              label: AppText(
                  label: AppLocalizations.of(context).password,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              title: '',
              formFieldItemType: AppFormFieldItemType.PASSWORD,
              obscureTextSubject: BehaviorSubject<bool>.seeded(true),
              subject: BehaviorSubject(),
              textInputType: TextInputType.visiblePassword,
              labelFontColor: Colors.white,
              borderColor: AppColors.greyColor,
              fontColor: AppColors.whiteColor,
              focusedBorderColor: AppColors.PINK_COLOR,
              iconColor: Colors.transparent,
              focusedIconColor: Colors.transparent),
          SizedBox(height: SizeConfig.padding),
          AppTextFormFieldItem(
              label: AppText(
                  label: AppLocalizations.of(context).confirmPassword,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              title: '',
              formFieldItemType: AppFormFieldItemType.PASSWORD,
              obscureTextSubject: BehaviorSubject<bool>.seeded(true),
              subject: BehaviorSubject(),
              textInputType: TextInputType.visiblePassword,
              labelFontColor: Colors.white,
              borderColor: AppColors.greyColor,
              fontColor: AppColors.whiteColor,
              focusedBorderColor: AppColors.PINK_COLOR,
              iconColor: Colors.transparent,
              focusedIconColor: Colors.transparent),
          SizedBox(height: SizeConfig.padding * 2),
          AppButton(
              width: double.infinity,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).changePassword,
              borderColor: AppColors.PINK_COLOR,
              backgroundColor: AppColors.PINK_COLOR,
              onTap: () {}),
          SizedBox(height: SizeConfig.padding),
          AppButton(
              width: double.infinity,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.PINK_COLOR),
              title: AppLocalizations.of(context).cancel,
              borderColor: AppColors.transparentColor,
              backgroundColor: AppColors.transparentColor,
              onTap: () => Navigator.pop(context)),
          SizedBox(height: SizeConfig.extraPadding / 1.5),
        ],
      ),
    );
  }

  @override
  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }

  @override
  bool getResizeToAvoidBottomInset() {
    return false;
  }
}
