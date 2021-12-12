import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_otp_text_field.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class PayView extends BaseStatefulWidget {
  @override
  _PayViewState createState() => _PayViewState();
}

class _PayViewState extends BaseState<PayView> {
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
          AppOtpTextField(
            fieldHeight: 50,
            borderWidth: 0.0,
            fieldWidth: 50,
            numberOfFields: 4,
            borderRadius: BorderRadius.circular(10),
            borderColor: AppColors.whiteColor,
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
            ],
            fillColor: AppColors.PINK_COLOR,
            fieldLength: 1,
            onSubmit: (value) {},
          ),
          AppImage(
            path: AppAssets.payImage,
            height: SizeConfig.extraPadding,
            width: SizeConfig.screenWidth,
          ),
          AppText(
              label: '20.00 SAR',
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor)),
          AppText(
              label: '20.00' + AppLocalizations.of(context).coinRial,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor)),
          SizedBox(height: SizeConfig.padding),
          GestureDetector(
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
                child: AppImage(
                    path: AppAssets.payButtom, boxFit: BoxFit.scaleDown)),
          ),
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
                AppButton(
                  title: cancelButtonTitle.toString(),
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.PINK_COLOR,
                  backgroundColor: AppColors.PINK_COLOR,
                  onTap: () => Navigator.pop(context),
                  width: double.infinity,
                )
              ],
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.padding,
                          vertical: SizeConfig.padding),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRaduis),
                          color: AppColors.DARK_GRAY_COLOR),
                      child: Column(
                        children: [
                          AppText(
                              label: AppLocalizations.of(context).receipt,
                              style: AppFontStyle.bahijSansArabic(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          AppImage(path: AppAssets.qrCodeImage)
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.padding),
                    Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.padding,
                          vertical: SizeConfig.padding),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRaduis),
                          color: AppColors.DARK_GRAY_COLOR),
                      child: Column(
                        children: [
                          AppText(
                              label: AppLocalizations.of(context).receipt,
                              style: AppFontStyle.bahijSansArabic(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          AppImage(path: AppAssets.qrCodeImage)
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
