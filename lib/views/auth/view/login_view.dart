import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/custom_pressed_text.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rasid_jack/common/widgets/custom_button.dart';
import 'package:rasid_jack/common/widgets/custom_input.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

class LoginView extends BaseStatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.padding, vertical: SizeConfig.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.padding),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.LOGO,
            ),
          ),
          SizedBox(height: SizeConfig.btnHeight),
          CustomInput(
            labelText: AppLocalizations.of(context).phoneNum,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: SizeConfig.padding),
          CustomInput(
            obscureText: true,
            labelText: AppLocalizations.of(context).password,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(height: SizeConfig.padding),
          CustomPressedText(text: AppLocalizations.of(context).forgetPassword),
          SizedBox(height: SizeConfig.padding),
          CustomButton(
            buttonText: AppLocalizations.of(context).login,
            press: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeView())),
          ),
          SizedBox(height: SizeConfig.extraPadding / 2),
          Align(
              alignment: Alignment.center,
              child: CustomText(
                  text: AppLocalizations.of(context).aboutPhone,
                  fontSize: SizeConfig.titleFontSize)),
          SizedBox(height: 10),
          Divider(color: AppColors.GRAY_COLOR),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPressedText(
                  text: AppLocalizations.of(context).notHaveAccount),
              CustomPressedText(
                  text: AppLocalizations.of(context).register,
                  textColor: AppColors.PINK_COLOR),
            ],
          ),
        ],
      ),
    );
  }
}
