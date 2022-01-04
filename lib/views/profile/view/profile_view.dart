import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/utilities.dart';
import 'package:rasid_jack/views/profile/bloc/profile_bloc.dart';
import 'package:rasid_jack/views/profile/model/profile_model.dart';
import 'package:rxdart/rxdart.dart';

class ProfileView extends BaseStatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> {
  ProfileBloc _profileInfoBloc = ProfileBloc();
  @override
  void initState() {
    // TODO: implement initState
    _profileInfoBloc.getProfileData();
    listenForResponse(_profileInfoBloc).listen((event) {
      _profileInfoBloc.nameTextEditingController.text =
          _profileInfoBloc.nameValue.toString();
      _profileInfoBloc.emailTextEditingController.text =
          _profileInfoBloc.emailValue.toString();
      _profileInfoBloc.phoneNumTextEditingController.text =
          _profileInfoBloc.phoneValue.toString();
      _profileInfoBloc.statementNumTextEditingController.text =
          _profileInfoBloc.statementNumValue.toString();
      _profileInfoBloc.idNumTextEditingController.text =
          _profileInfoBloc.idNumValue.toString();
    });

    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return StreamBuilder(
        stream: _profileInfoBloc.successStream,
        builder: (context, AsyncSnapshot<ProfileModel> snapshot) {
          return Form(
            key: _profileInfoBloc.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: AppImage(
                          path: AppAssets.LOGO,
                          height: SizeConfig.btnHeight * 1.5)),
                  SizedBox(height: SizeConfig.padding * 3),
                  AppText(
                      label: AppLocalizations.of(context).userData,
                      style: AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor)),
                  SizedBox(height: SizeConfig.padding * 2),
                  AppTextFormFieldItem(
                      controller: _profileInfoBloc.nameTextEditingController,
                      label: AppText(
                          label: AppLocalizations.of(context).userName,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      title: '',
                      formFieldItemType: AppFormFieldItemType.USER_NAME,
                      obscureTextSubject: _profileInfoBloc.obscureTextSubject,
                      subject: _profileInfoBloc.nameSubject,
                      textInputType: TextInputType.visiblePassword,
                      labelFontColor: Colors.white,
                      borderColor: AppColors.greyColor,
                      fontColor: AppColors.whiteColor,
                      focusNode: _profileInfoBloc.nameFocusNode,
                      focusedBorderColor: AppColors.PINK_COLOR,
                      iconColor: Colors.transparent,
                      focusedIconColor: Colors.transparent),
                  SizedBox(height: SizeConfig.padding),
                  AppTextFormFieldItem(
                      readOnly: false,
                      label: AppText(
                          label: AppLocalizations.of(context).email,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      title: '',
                      controller: _profileInfoBloc.emailTextEditingController,
                      focusNode: _profileInfoBloc.emailFocusNode,
                      formFieldItemType: AppFormFieldItemType.EMAIL,
                      obscureTextSubject: _profileInfoBloc.obscureTextSubject,
                      subject: _profileInfoBloc.emailSubject,
                      textInputType: TextInputType.visiblePassword,
                      labelFontColor: Colors.white,
                      borderColor: AppColors.greyColor,
                      fontColor: AppColors.whiteColor,
                      focusedBorderColor: AppColors.PINK_COLOR,
                      iconColor: Colors.transparent,
                      focusedIconColor: Colors.transparent),
                  SizedBox(height: SizeConfig.padding),
                  AppTextFormFieldItem(
                      readOnly: false,
                      controller:
                          _profileInfoBloc.phoneNumTextEditingController,
                      focusNode: _profileInfoBloc.passwordFocusNode,
                      label: AppText(
                          label: AppLocalizations.of(context).phoneNumber,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      title: '',
                      formFieldItemType: AppFormFieldItemType.PHONE,
                      obscureTextSubject: _profileInfoBloc.obscureTextSubject,
                      subject: _profileInfoBloc.phoneNumSubject,
                      textInputType: TextInputType.visiblePassword,
                      labelFontColor: Colors.white,
                      borderColor: AppColors.greyColor,
                      fontColor: AppColors.whiteColor,
                      focusedBorderColor: AppColors.PINK_COLOR,
                      iconColor: Colors.transparent,
                      focusedIconColor: Colors.transparent),
                  SizedBox(height: SizeConfig.padding),
                  AppTextFormFieldItem(
                      readOnly: false,
                      controller:
                          _profileInfoBloc.statementNumTextEditingController,
                      label: AppText(
                          label: AppLocalizations.of(context).numberofstatement,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      title: '',
                      formFieldItemType: AppFormFieldItemType.NUMBER,
                      obscureTextSubject: _profileInfoBloc.obscureTextSubject,
                      subject: _profileInfoBloc.statementNumSubject,
                      textInputType: TextInputType.visiblePassword,
                      labelFontColor: Colors.white,
                      borderColor: AppColors.greyColor,
                      fontColor: AppColors.whiteColor,
                      focusedBorderColor: AppColors.PINK_COLOR,
                      iconColor: Colors.transparent,
                      focusedIconColor: Colors.transparent),
                  SizedBox(height: SizeConfig.padding),
                  AppTextFormFieldItem(
                      readOnly: false,
                      controller: _profileInfoBloc.idNumTextEditingController,
                      focusNode: _profileInfoBloc.idNumFocusNode,
                      label: AppText(
                          label: AppLocalizations.of(context).idNumber,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      title: '',
                      formFieldItemType: AppFormFieldItemType.NUMBER,
                      obscureTextSubject: _profileInfoBloc.obscureTextSubject,
                      subject: _profileInfoBloc.idNumSubject,
                      textInputType: TextInputType.visiblePassword,
                      labelFontColor: Colors.white,
                      borderColor: AppColors.greyColor,
                      fontColor: AppColors.whiteColor,
                      focusedBorderColor: AppColors.PINK_COLOR,
                      iconColor: Colors.transparent,
                      focusedIconColor: Colors.transparent),
                ],
              ),
            ),
          );
        });
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
              width: double.infinity,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).confirm,
              borderColor: AppColors.PINK_COLOR,
              backgroundColor: AppColors.PINK_COLOR,
              onTap: () => _profileInfoBloc.profile(context)),
          SizedBox(height: SizeConfig.padding),
          AppButton(
              width: double.infinity,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).back,
              borderColor: AppColors.PINK_COLOR,
              backgroundColor: AppColors.PINK_COLOR,
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
