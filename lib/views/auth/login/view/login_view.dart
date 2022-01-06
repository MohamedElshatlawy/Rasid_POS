import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/request_status.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/common/widgets/loading_dialog.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/utilities.dart';
import 'package:rasid_jack/views/auth/login/bloc/login_bloc.dart';
import 'package:rasid_jack/views/auth/forget_password/view/forget_password_view.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rxdart/rxdart.dart';

class LoginView extends BaseStatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  LoginBloc _loginBloc = LoginBloc();
  @override
  void initState() {
    // TODO: implement initState
    // _loginBloc.login();
    listenForResponse(_loginBloc).listen((event) {});

    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return StreamBuilder(
        stream: _loginBloc.successStream,
        builder: (context, AsyncSnapshot<UserModel> snapshot) {
          return Form(
            key: _loginBloc.formKey,
            child: Column(
              children: [
                SizedBox(height: SizeConfig.padding * 6),
                Align(
                    alignment: Alignment.center,
                    child:
                        AppImage(path: AppAssets.LOGO, boxFit: BoxFit.cover)),
                SizedBox(height: SizeConfig.padding * 5),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: SizeConfig.padding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              label: AppLocalizations.of(context).phoneNum,
                              style: AppFontStyle.bahijSansArabic(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          SizedBox(height: SizeConfig.padding),
                          AppTextFormFieldItem(
                              validator: (value) =>
                                  _loginBloc.validateEmail(value!),
                              controller: _loginBloc.emailTextEditingController,
                              title: '',
                              formFieldItemType: AppFormFieldItemType.EMAIL,
                              subject: _loginBloc.emailSubject,
                              textInputType: TextInputType.emailAddress,
                              labelFontColor: AppColors.whiteColor,
                              borderColor: AppColors.BUTTON_COLOR,
                              focusedBorderColor: AppColors.whiteColor,
                              fontColor: AppColors.whiteColor,
                              iconColor: Colors.transparent,
                              focusedIconColor: Colors.transparent),
                          SizedBox(height: SizeConfig.padding),
                          AppText(
                              label: AppLocalizations.of(context).password,
                              style: AppFontStyle.bahijSansArabic(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          SizedBox(height: SizeConfig.padding),
                          AppTextFormFieldItem(
                              // validator: (value) {
                              //   _loginBloc.validatePassword(value!);
                              // },
                              controller:
                                  _loginBloc.passwordTextEditingController,
                              title: '',
                              formFieldItemType: AppFormFieldItemType.PASSWORD,
                              obscureTextSubject: _loginBloc.obscureTextSubject,
                              subject: _loginBloc.passwordSubject,
                              textInputType: TextInputType.visiblePassword,
                              labelFontColor: Colors.white,
                              borderColor: AppColors.BUTTON_COLOR,
                              fontColor: AppColors.whiteColor,
                              focusedBorderColor: AppColors.whiteColor,
                              iconColor: Colors.transparent,
                              focusedIconColor: Colors.transparent),
                          SizedBox(height: SizeConfig.padding),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgetPasswordView())),
                            child: AppText(
                                label:
                                    AppLocalizations.of(context).forgetPassword,
                                style: AppFontStyle.bahijSansArabic(
                                    fontSize: SizeConfig.titleFontSize,
                                    fontColor: AppColors.whiteColor)),
                          ),
                          SizedBox(height: SizeConfig.padding * 2),
                          AppButton(
                              width: double.infinity,
                              style: AppFontStyle.bahijSansArabic(
                                  fontSize: SizeConfig.titleFontSize,
                                  fontColor: AppColors.whiteColor),
                              title: AppLocalizations.of(context).login,
                              borderColor: AppColors.BUTTON_COLOR,
                              backgroundColor: AppColors.BUTTON_COLOR,
                              onTap: () =>
                                  _loginBloc.formKey.currentState!.validate()
                                      ? _loginBloc.login(context)
                                      : null),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Future<bool> onWillPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(false);
  }
}