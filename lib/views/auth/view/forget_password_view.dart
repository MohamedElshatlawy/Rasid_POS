import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/blocs/timer/timer_bloc.dart';
import 'package:rasid_jack/common/blocs/timer/timer_text.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/common/widgets/title_and_description.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/auth/view/bloc/forget_password_bloc.dart';
import 'package:rasid_jack/views/auth/view/pin_code_view.dart';
import 'package:rasid_jack/views/auth/view/model/forget_model.dart';
import 'package:rxdart/rxdart.dart';

class ForgetPasswordView extends BaseStatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends BaseState<ForgetPasswordView> {
  // ForgetPasswordBloc bloc = ForgetPasswordBloc(timerText: '');
  TimerBloc timerBloc = TimerBloc();
  ForgetPasswordBloc _forgtePasswordBloc = ForgetPasswordBloc();
  @override
  void initState() {
    // TODO: implement initState

    listenForResponse(_forgtePasswordBloc).listen((event) {});

    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return StreamBuilder(
        stream: _forgtePasswordBloc.successStream,
        builder: (context, AsyncSnapshot<ForgetPasswordModel> snapshot) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
            child: Form(
              key: _forgtePasswordBloc.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppImage(
                      path: AppAssets.LOGO, height: SizeConfig.btnHeight * 1.5),
                  SizedBox(height: SizeConfig.padding * 2),
                  TitleAndDescription(
                      label: AppLocalizations.of(context).forgetPassword,
                      descriptionLabel:
                          AppLocalizations.of(context).forgetSubtitle),
                  SizedBox(height: SizeConfig.padding * 3),
                  AppTextFormFieldItem(
                      controller:
                          _forgtePasswordBloc.emailTextEditingController,
                      validator: (value) =>
                          _forgtePasswordBloc.validateEmail(value!),
                      title: '',
                      formFieldItemType: AppFormFieldItemType.EMAIL,
                      label: AppText(
                          label: AppLocalizations.of(context).emailAddress,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      subject: _forgtePasswordBloc.emailSubject,
                      textInputType: TextInputType.emailAddress,
                      labelFontColor: AppColors.greyColor,
                      borderColor: AppColors.greyColor,
                      focusedBorderColor: AppColors.PINK_COLOR,
                      fontColor: AppColors.whiteColor,
                      iconColor: Colors.transparent,
                      focusedIconColor: Colors.transparent),
                  // StreamBuilder(
                  //     stream: bloc.timerValuesStream,
                  //     builder: (context, AsyncSnapshot snapshot) {
                  //       return bloc.visibility
                  //           ? AppButton(
                  //               width: double.infinity,
                  //               style: AppFontStyle.bahijSansArabic(
                  //                   fontSize: SizeConfig.titleFontSize,
                  //                   fontColor: AppColors.PINK_COLOR),
                  //               title: 'إعادة الارسال؟',
                  //               borderColor: AppColors.transparentColor,
                  //               backgroundColor: AppColors.transparentColor,
                  //               onTap: () => bloc.startTimeout(context))
                  //           : AppText(
                  //               label: snapshot.data ?? '',
                  //               style: AppFontStyle.bahijSansArabic(
                  //                   fontSize: SizeConfig.textFontSize * 1.5,
                  //                   fontColor: AppColors.greyColor));
                  //     }),
                  SizedBox(height: SizeConfig.padding),
                  // TimerText(timerBloc: timerBloc),
                  // SizedBox(height: SizeConfig.padding * 2),
                  AppButton(
                      width: double.infinity,
                      style: AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor),
                      title: AppLocalizations.of(context).restorePassword,
                      borderColor: AppColors.PINK_COLOR,
                      backgroundColor: AppColors.PINK_COLOR,
                      onTap: () =>
                          _forgtePasswordBloc.formKey.currentState!.validate()
                              ? _forgtePasswordBloc.forgetPassword(context)
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
                  SizedBox(height: SizeConfig.extraPadding),
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
