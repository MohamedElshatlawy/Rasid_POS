import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:rasid_jack/common/widgets/custom_popUp.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/common/widgets/custom_button.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class PayView extends BaseStatefulWidget {
  @override
  _PayViewState createState() => _PayViewState();
}

class _PayViewState extends BaseState<PayView> {
  bool visable = false;
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.padding, vertical: SizeConfig.extraPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PinCodeTextField(
            maxLength: 4,
            highlightPinBoxColor: AppColors.PINK_COLOR,
            pinBoxHeight: 50,
            pinBoxBorderWidth: 0.0,
            pinBoxWidth: 50,
            pinBoxRadius: 10,
            pinTextStyle: TextStyle(
              fontSize: 20,
            ),
            onDone: (value) {
              setState(() {
                visable = true;
              });
            },
          ),
          Image.asset(
            AppAssets.payImage,
            height: SizeConfig.extraPadding,
            width: SizeConfig.screenWidth,
          ),
          CustomText(
            text: '20.00 SAR',
            fontSize: SizeConfig.titleFontSize,
          ),
          CustomText(
            text: '20.00' + AppLocalizations.of(context).coinRial,
            fontSize: SizeConfig.titleFontSize,
          ),
          SizedBox(height: SizeConfig.padding),
          Visibility(
              visible: visable,
              child: GestureDetector(
                onTap: () {
                  showAppDialog(
                      title: '',
                      errorMessage: '',
                      okButtonTitle: '',
                      cancelButtonTitle: AppLocalizations.of(context).back);
                },
                child: Container(
                    width: double.infinity,
                    height: 114,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.DARK_GRAY_COLOR),
                    child: Image.asset(AppAssets.payButtom)),
              )),
        ],
      ),
    );
  }

  @override
  Future<void> showAppDialog(
      {required String title,
      required String errorMessage,
      required String okButtonTitle,
      String? cancelButtonTitle}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.transparent,
              actions: [
                CustomButton(
                  buttonText: cancelButtonTitle.toString(),
                  buttonColor: AppColors.PINK_COLOR,
                  press: () => Navigator.pop(context),
                )
              ],
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomPopUp(
                      margin: EdgeInsets.only(bottom: SizeConfig.padding),
                      contentPopUp: Column(
                        children: [
                          CustomText(
                            text: AppLocalizations.of(context).receipt,
                            textColor: AppColors.WHITH_COLOR,
                          ),
                          Image.asset(
                            AppAssets.qrCodeImage,
                          ),
                        ],
                      ),
                    ),
                    CustomPopUp(
                      margin: EdgeInsets.zero,
                      contentPopUp: Column(
                        children: [
                          CustomText(
                            text: AppLocalizations.of(context).receipt,
                            textColor: AppColors.WHITH_COLOR,
                          ),
                          Image.asset(
                            AppAssets.qrCodeImage,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }
}
