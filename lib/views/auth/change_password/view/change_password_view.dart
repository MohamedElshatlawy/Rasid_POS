import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
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
import 'package:rasid_jack/views/auth/change_password/bloc/change_password_bloc.dart';
import 'package:rasid_jack/views/auth/forget_password/model/forget_model.dart';
import 'package:rxdart/rxdart.dart';

class ChangePasswordView extends BaseStatefulWidget {
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends BaseState<ChangePasswordView> {
  ChangePasswordBloc _changePasswordBloc = ChangePasswordBloc();
  @override
  void initState() {
    // TODO: implement initState

    listenForResponse(_changePasswordBloc).listen((event) {});

    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return StreamBuilder(
        stream: _changePasswordBloc.successStream,
        builder: (context, AsyncSnapshot<ForgetPasswordModel> snapshot) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
            child: Form(
              key: _changePasswordBloc.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppImage(
                      path: AppAssets.LOGO, height: SizeConfig.btnHeight * 1.5),
                  SizedBox(height: SizeConfig.padding * 2),
                  TitleAndDescription(
                      label: AppLocalizations.of(context).changePassword,
                      descriptionLabel:
                          AppLocalizations.of(context).forgetSubtitle),
                  SizedBox(height: SizeConfig.padding * 2),
                  AppTextFormFieldItem(
                      validator: (value) {
                        _changePasswordBloc.validateEmail(value!);
                      },
                      controller:
                          _changePasswordBloc.passwordTextEditingController,
                      label: AppText(
                          label: AppLocalizations.of(context).password,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      title: '',
                      formFieldItemType: AppFormFieldItemType.PASSWORD,
                      obscureTextSubject:
                          _changePasswordBloc.obscureTextSubject,
                      subject: _changePasswordBloc.passwordSubject,
                      textInputType: TextInputType.visiblePassword,
                      labelFontColor: Colors.white,
                      borderColor: AppColors.greyColor,
                      fontColor: AppColors.whiteColor,
                      focusedBorderColor: AppColors.PINK_COLOR,
                      iconColor: Colors.transparent,
                      focusedIconColor: Colors.transparent),
                  SizedBox(height: SizeConfig.padding),
                  AppTextFormFieldItem(
                      validator: (value) {
                        _changePasswordBloc.validateIdentity(value!);
                      },
                      controller: _changePasswordBloc
                          .confirmPasswordTextEditingController,
                      label: AppText(
                          label: AppLocalizations.of(context).confirmPassword,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      title: '',
                      formFieldItemType: AppFormFieldItemType.PASSWORD,
                      obscureTextSubject:
                          _changePasswordBloc.obscureTextSubject,
                      subject: _changePasswordBloc.confirmPasswordSubject,
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
                      onTap: () =>
                          _changePasswordBloc.formKey.currentState!.validate()
                              ? _changePasswordBloc.changePassword(context)
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
                  SizedBox(height: SizeConfig.extraPadding / 1.5),
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