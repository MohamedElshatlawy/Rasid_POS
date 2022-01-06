import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/blocs/timer/timer_bloc.dart';
import 'package:rasid_jack/common/blocs/timer/timer_text.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_otp_text_field.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/title_and_description.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/auth/pin_code/bloc/pin_code_bloc.dart';
import 'package:rasid_jack/views/auth/change_password/view/change_password_view.dart';
import 'package:rasid_jack/views/auth/pin_code/model/pin_code_model.dart';

class PinCodeView extends BaseStatefulWidget {
  String email;
  PinCodeView({required this.email});
  @override
  _PinCodeViewState createState() => _PinCodeViewState();
}

class _PinCodeViewState extends BaseState<PinCodeView> {
  TimerBloc timerBloc = TimerBloc();
  PinCodeBloc _pinCodeBloc = PinCodeBloc();

  @override
  void initState() {
    // TODO: implement initState
    listenForResponse(_pinCodeBloc).listen((event) {});

    timerBloc.incrementTimer(30);
    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return StreamBuilder(
        stream: _pinCodeBloc.successStream,
        builder: (context, AsyncSnapshot<PinCodeModel> snapshot) {
          return Form(
            key: _pinCodeBloc.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppImage(
                      path: AppAssets.LOGO, height: SizeConfig.btnHeight * 1.5),
                  SizedBox(height: SizeConfig.padding * 2),
                  TitleAndDescription(
                      label: AppLocalizations.of(context).pinCodeTitle,
                      descriptionLabel:
                          AppLocalizations.of(context).pinCodeSubitle),
                  SizedBox(height: SizeConfig.padding * 3),
                  AppOtpTextField(
                    onSubmit: (val) => _pinCodeBloc.updatepinCode(val),
                    onCodeChanged: (val) => _pinCodeBloc.updatepinCode(val),
                    fieldHeight: 50,
                    fieldWidth: 45,
                    numberOfFields: 6,
                    borderRadius: BorderRadius.circular(10),
                    enabledBorderColor: AppColors.greyColor,
                    focusedBorderColor: AppColors.whiteColor,
                    showFieldAsBox: true,
                    filled: true,
                    styles: [
                      AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor),
                      AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor),
                      AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor),
                      AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor),
                      AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor),
                      AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor),
                    ],
                    fillColor: AppColors.transparentColor,
                    fieldLength: 1,
                  ),
                  SizedBox(height: SizeConfig.padding * 2),
                  TimerText(timerBloc: timerBloc),
                  SizedBox(height: SizeConfig.padding * 2),
                  AppButton(
                      width: double.infinity,
                      style: AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor),
                      title: AppLocalizations.of(context).confirm,
                      borderColor: AppColors.PINK_COLOR,
                      backgroundColor: AppColors.PINK_COLOR,
                      onTap: () => _pinCodeBloc.formKey.currentState!.validate()
                          ? _pinCodeBloc.pinCode(context, widget.email)
                          : null),
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
                  SizedBox(height: SizeConfig.padding * 7),
                ],
              ),
            ),
          );
        });
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
