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
import 'package:rasid_jack/views/auth/view/pin_code_view.dart';
import 'package:rxdart/rxdart.dart';

class ForgetPasswordView extends BaseStatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends BaseState<ForgetPasswordView> {
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
              label: AppLocalizations.of(context).forgetPassword,
              style: AppFontStyle.bahijBold(
                  fontSize: SizeConfig.titleFontSize * 1.5,
                  fontColor: AppColors.whiteColor)),
          AppText(
              label: AppLocalizations.of(context).forgetSubtitle,
              style: AppFontStyle.bahijBold(
                  fontSize: SizeConfig.textFontSize * 1.5,
                  fontColor: AppColors.greyColor)),
          SizedBox(height: SizeConfig.padding * 3),
          AppTextFormFieldItem(
              title: '',
              formFieldItemType: AppFormFieldItemType.EMAIL,
              label: AppText(
                  label: AppLocalizations.of(context).emailAddress,
                  style: AppFontStyle.bahijLight(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              subject: BehaviorSubject(),
              textInputType: TextInputType.emailAddress,
              labelFontColor: AppColors.greyColor,
              borderColor: AppColors.greyColor,
              focusedBorderColor: AppColors.PINK_COLOR,
              fontColor: AppColors.whiteColor,
              iconColor: Colors.transparent,
              focusedIconColor: Colors.transparent),
          SizedBox(height: SizeConfig.padding * 2),
          AppButton(
              width: double.infinity,
              style: AppFontStyle.bahijBold(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).restorePassword,
              borderColor: AppColors.PINK_COLOR,
              backgroundColor: AppColors.PINK_COLOR,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PinCodeView()))),
          SizedBox(height: SizeConfig.padding),
          AppButton(
              width: double.infinity,
              style: AppFontStyle.bahijBold(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.PINK_COLOR),
              title: AppLocalizations.of(context).cancel,
              borderColor: AppColors.transparentColor,
              backgroundColor: AppColors.transparentColor,
              onTap: () => Navigator.pop(context)),
          SizedBox(height: SizeConfig.extraPadding),
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
