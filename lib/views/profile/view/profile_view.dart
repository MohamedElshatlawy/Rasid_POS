import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/blocs/timer/timer_bloc.dart';
import 'package:rasid_jack/common/blocs/timer/timer_text.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_otp_text_field.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/auth/view/change_password_view.dart';
import 'package:rxdart/rxdart.dart';

class ProfileView extends BaseStatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: AppImage(
                  path: AppAssets.LOGO, height: SizeConfig.btnHeight * 1.5)),
          SizedBox(height: SizeConfig.padding * 3),
          AppText(
              label: AppLocalizations.of(context).userData,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor)),
          SizedBox(height: SizeConfig.padding * 2),
          AppTextFormFieldItem(
              label: AppText(
                  label: AppLocalizations.of(context).userName,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              title: '',
              formFieldItemType: AppFormFieldItemType.USER_NAME,
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
                  label: AppLocalizations.of(context).email,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              title: '',
              formFieldItemType: AppFormFieldItemType.EMAIL,
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
                  label: AppLocalizations.of(context).phoneNumber,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              title: '',
              formFieldItemType: AppFormFieldItemType.PHONE,
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
                  label: AppLocalizations.of(context).numberofstatement,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              title: '',
              formFieldItemType: AppFormFieldItemType.NUMBER,
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
                  label: AppLocalizations.of(context).idNumber,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              title: '',
              formFieldItemType: AppFormFieldItemType.NUMBER,
              obscureTextSubject: BehaviorSubject<bool>.seeded(true),
              subject: BehaviorSubject(),
              textInputType: TextInputType.visiblePassword,
              labelFontColor: Colors.white,
              borderColor: AppColors.greyColor,
              fontColor: AppColors.whiteColor,
              focusedBorderColor: AppColors.PINK_COLOR,
              iconColor: Colors.transparent,
              focusedIconColor: Colors.transparent),
        ],
      ),
    );
  }

  @override
  bool getResizeToAvoidBottomInset() {
    return false;
  }

  @override
  String getScaffoldBackgroundImage() {
    // TODO: implement getScaffoldBackgroundImage
    return AppAssets.PROFILE;
  }

  @override
  Widget? getBottomNavigationBar() {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.padding),
      child: AppButton(
          width: double.infinity,
          style: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.titleFontSize,
              fontColor: AppColors.whiteColor),
          title: AppLocalizations.of(context).back,
          borderColor: AppColors.PINK_COLOR,
          backgroundColor: AppColors.PINK_COLOR,
          onTap: () => Navigator.pop(context)),
    );
  }
}
