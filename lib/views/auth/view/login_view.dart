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
import 'package:rasid_jack/views/auth/view/forget_password_view.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rasid_jack/views/mainScreen/view/main_screen_view.dart';
import 'package:rxdart/rxdart.dart';

class LoginView extends BaseStatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.center,
              child: AppImage(path: AppAssets.LOGO, boxFit: BoxFit.cover)),
          SizedBox(height: SizeConfig.padding * 5),
          AppText(
              label: AppLocalizations.of(context).phoneNum,
              style: AppFontStyle.bahijLight(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.whiteColor)),
          AppTextFormFieldItem(
              title: '',
              formFieldItemType: AppFormFieldItemType.PHONE,
              subject: BehaviorSubject(),
              textInputType: TextInputType.phone,
              labelFontColor: AppColors.whiteColor,
              borderColor: AppColors.BUTTON_COLOR,
              focusedBorderColor: AppColors.whiteColor,
              fontColor: AppColors.whiteColor,
              iconColor: Colors.transparent,
              focusedIconColor: Colors.transparent),
          SizedBox(height: SizeConfig.padding),
          AppText(
              label: AppLocalizations.of(context).password,
              style: AppFontStyle.bahijLight(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.whiteColor)),
          AppTextFormFieldItem(
              title: '',
              formFieldItemType: AppFormFieldItemType.PASSWORD,
              obscureTextSubject: BehaviorSubject<bool>.seeded(true),
              subject: BehaviorSubject(),
              textInputType: TextInputType.visiblePassword,
              labelFontColor: Colors.white,
              borderColor: AppColors.BUTTON_COLOR,
              fontColor: AppColors.whiteColor,
              focusedBorderColor: AppColors.whiteColor,
              iconColor: Colors.transparent,
              focusedIconColor: Colors.transparent),
          SizedBox(height: SizeConfig.padding),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ForgetPasswordView())),
            child: AppText(
                label: AppLocalizations.of(context).forgetPassword,
                style: AppFontStyle.bahijBold(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor)),
          ),
          SizedBox(height: SizeConfig.padding * 2),
          AppButton(
              width: double.infinity,
              style: AppFontStyle.bahijBold(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).login,
              borderColor: AppColors.BUTTON_COLOR,
              backgroundColor: AppColors.BUTTON_COLOR,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreenView()))),
          SizedBox(height: SizeConfig.extraPadding),
          // Align(
          //     alignment: Alignment.center,
          //     child: AppText(
          //       label: AppLocalizations.of(context).aboutPhone,
          //       style: AppFontStyle.bahijLight(
          //           fontSize: SizeConfig.textFontSize,
          //           fontColor: AppColors.whiteColor),
          //     )),
          // SizedBox(height: 10),
          // AppDivider(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     AppText(
          //         label: AppLocalizations.of(context).notHaveAccount,
          //         style: AppFontStyle.bahijLight(
          //             fontSize: SizeConfig.textFontSize,
          //             fontColor: AppColors.whiteColor)),
          //     AppText(
          //         label: AppLocalizations.of(context).register,
          //         style: AppFontStyle.bahijBold(
          //             fontSize: SizeConfig.textFontSize,
          //             fontColor: AppColors.PINK_COLOR)),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  bool getResizeToAvoidBottomInset() {
    return false;
  }
}
