import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/blocs/timer/timer_bloc.dart';
import 'package:rasid_jack/common/blocs/timer/timer_text.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_otp_text_field.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';

import 'package:rxdart/rxdart.dart';

import '../../../common/widgets/title_and_description.dart';

enum VerifyType { REGISTER, FORGOT_PASSWORD }

class VerificationView extends BaseStatefulWidget {
  final BehaviorSubject emailSubject;
  final VerifyType verifyType;
  final String title;

  VerificationView(
      {required this.emailSubject,
      required this.verifyType,
      required this.title});

  @override
  _VerificationViewState createState() => _VerificationViewState();
}

class _VerificationViewState extends BaseState<VerificationView> {
  TimerBloc timerBloc = TimerBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerBloc = BlocProvider.of<TimerBloc>(context);
    timerBloc.incrementTimer(30);
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
            label: widget.title,
            descriptionLabel: AppLocalizations.of(context).changePassword,
          ),

          Center(
              child: AppText(
            label: widget.emailSubject.value,
            style: AppFontStyle.bahijLight(
                fontSize: SizeConfig.textFontSize,
                fontColor: AppColors.WHITH_COLOR),
          )),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          // StreamBuilder<Color>(
          //     stream: registerBloc.otpContainerBorderColorSubject.stream,
          //     builder: (context, snapshot) {
          //       return
          AppOtpTextField(
            numberOfFields: 4,
            fieldLength: 1,
            borderColor: AppColors.accentColor,
            margin: EdgeInsets.all(10),
            fieldWidth: SizeConfig.btnHeight,
            fieldHeight: SizeConfig.btnHeight,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            textStyle: AppFontStyle.bahijBold(
                fontSize: SizeConfig.titleFontSize,
                fontColor: AppColors.accentColor),
            decoration: InputDecoration(
              counterText: "",
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: AppColors.accentColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeConfig.btnRadius))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: AppColors.greyColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeConfig.btnRadius))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: AppColors.greyColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeConfig.btnRadius))),
              contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            ),
            onTap: () {
              // registerBloc.otpContainerBorderColorSubject.sink
              //     .add(AppColors.accentColor);
            },
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            }, // end onSubmit
          ),
          // ;
          //           }),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          Center(
            child: AppText(
              label: AppLocalizations.of(context).forgetSubtitle,
              style: AppFontStyle.bahijLight(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.greyColor),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical),
          Center(
              child: TimerText(
            timerBloc: timerBloc,
          )),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          AppButton(
              title: AppLocalizations.of(context).changePassword,
              style: AppFontStyle.bahijSemiBold(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.WHITH_COLOR),
              borderColor: AppColors.accentColor,
              backgroundColor: AppColors.accentColor,
              width: SizeConfig.blockSizeHorizontal * 100,
              onTap: () {}),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          AppButton(
              title: AppLocalizations.of(context).cancel,
              style: AppFontStyle.bahijSemiBold(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.accentColor),
              borderColor: AppColors.transparentColor,
              backgroundColor: AppColors.transparentColor,
              height: SizeConfig.btnHeight / 4 * 3,
              width: SizeConfig.blockSizeHorizontal * 100,
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
}
