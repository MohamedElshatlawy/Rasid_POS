import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_dropdown.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
// import 'package:rasid_jack/common/widgets/custom_drawer.dart';
import 'package:rxdart/subjects.dart';

class CommissionView extends BaseStatefulWidget {
  @override
  _CommissionViewState createState() => _CommissionViewState();
}

class _CommissionViewState extends BaseState<CommissionView> {
  String value = 'اسم البنك';

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                  label: AppLocalizations.of(context).commissions,
                  style: AppFontStyle.bahijLight(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor)),
              SizedBox(width: SizeConfig.padding),
              AppImage(path: AppAssets.comissionImage)
            ],
          ),
          Container(
              padding: EdgeInsets.all(SizeConfig.padding),
              decoration: BoxDecoration(
                  color: AppColors.PINK_COLOR, shape: BoxShape.circle),
              child: Container(
                padding: EdgeInsets.all(SizeConfig.padding * 4),
                decoration: BoxDecoration(
                    color: AppColors.DARK_GRAY_COLOR, shape: BoxShape.circle),
                child: Column(
                  children: [
                    AppText(
                        label: '100',
                        style: AppFontStyle.bahijLight(
                            fontSize: SizeConfig.titleFontSize,
                            fontColor: AppColors.whiteColor)),
                    AppText(
                        label: AppLocalizations.of(context).coinRial,
                        style: AppFontStyle.bahijLight(
                            fontSize: SizeConfig.titleFontSize,
                            fontColor: AppColors.whiteColor)),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Future<void> showAppDialog(
      {required String title,
      required String errorMessage,
      required String okButtonTitle,
      String? cancelButtonTitle,
      Widget? content}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => SingleChildScrollView(
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                actions: [
                  AppButton(
                    width: double.infinity,
                    style: AppFontStyle.bahijLight(
                        fontSize: SizeConfig.textFontSize,
                        fontColor: AppColors.whiteColor),
                    title: cancelButtonTitle.toString(),
                    borderColor: AppColors.PINK_COLOR,
                    backgroundColor: AppColors.PINK_COLOR,
                    onTap: () => Navigator.pop(context),
                  )
                ],
                content: content!,
              ),
            ));
  }

  @override
  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
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
            style: AppFontStyle.bahijLight(
                fontSize: SizeConfig.titleFontSize,
                fontColor: AppColors.whiteColor),
            title: AppLocalizations.of(context).withdrawingCommissions,
            borderColor: AppColors.WHITH_COLOR,
            backgroundColor: AppColors.BUTTON_COLOR,
            onTap: () => showAppDialog(
              title: '',
              errorMessage: '',
              okButtonTitle: '',
              cancelButtonTitle: AppLocalizations.of(context).back,
              content: Container(
                margin: EdgeInsets.symmetric(vertical: SizeConfig.padding * 5),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.padding,
                    vertical: SizeConfig.padding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.DARK_GRAY_COLOR),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormFieldItem(
                        title: AppLocalizations.of(context).name,
                        label: AppText(
                            label: AppLocalizations.of(context).name,
                            style: AppFontStyle.bahijLight(
                                fontSize: SizeConfig.textFontSize,
                                fontColor: AppColors.whiteColor)),
                        formFieldItemType: AppFormFieldItemType.USER_NAME,
                        subject: BehaviorSubject(),
                        textInputType: TextInputType.name,
                        labelFontColor: AppColors.whiteColor,
                        borderColor: AppColors.whiteColor,
                        focusedBorderColor: AppColors.whiteColor,
                        iconColor: AppColors.transparentColor,
                        focusedIconColor: AppColors.whiteColor),
                    SizedBox(height: SizeConfig.padding),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.WHITH_COLOR),
                          borderRadius: BorderRadius.circular(10)),
                      child: AppDropdown(
                          titleKey: value,
                          style: AppFontStyle.bahijSemiBold(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor),
                          hint: "اسم البنك",
                          items: [
                            {"item": "اسم البنك"},
                            {"item": "A"}
                          ],
                          onChange: (val) {
                            setState(() {
                              value = val['item']!;
                            });
                          },
                          validator: (dynamic valid) {}),
                    ),
                    SizedBox(height: SizeConfig.padding),
                    AppTextFormFieldItem(
                        title: AppLocalizations.of(context).numberofstatement,
                        formFieldItemType: AppFormFieldItemType.NUMBER,
                        label: AppText(
                            label:
                                AppLocalizations.of(context).numberofstatement,
                            style: AppFontStyle.bahijLight(
                                fontSize: SizeConfig.textFontSize,
                                fontColor: AppColors.whiteColor)),
                        subject: BehaviorSubject(),
                        textInputType: TextInputType.name,
                        labelFontColor: AppColors.whiteColor,
                        borderColor: AppColors.whiteColor,
                        focusedBorderColor: AppColors.whiteColor,
                        iconColor: AppColors.transparentColor,
                        focusedIconColor: AppColors.whiteColor),
                    SizedBox(height: SizeConfig.padding * 2),
                    AppButton(
                      width: double.infinity,
                      style: AppFontStyle.bahijLight(
                          fontSize: SizeConfig.textFontSize,
                          fontColor: AppColors.whiteColor),
                      title: AppLocalizations.of(context).sendOrder,
                      borderColor: AppColors.BUTTON_COLOR,
                      backgroundColor: AppColors.BUTTON_COLOR,
                      onTap: () => showAppDialog(
                          title: '',
                          errorMessage: '',
                          okButtonTitle: '',
                          cancelButtonTitle: AppLocalizations.of(context).back,
                          content: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: SizeConfig.padding * 8),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.padding,
                                vertical: SizeConfig.padding * 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.DARK_GRAY_COLOR,
                            ),
                            child: AppText(
                              label: AppLocalizations.of(context)
                                  .commissionDilalog,
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.titleFontSize,
                                  fontColor: AppColors.whiteColor),
                            ),
                          )),
                    ),
                    SizedBox(height: SizeConfig.padding),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.padding),
          AppButton(
              width: double.infinity,
              title: AppLocalizations.of(context).back,
              style: AppFontStyle.bahijLight(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              borderColor: AppColors.PINK_COLOR,
              backgroundColor: AppColors.PINK_COLOR,
              onTap: () => Navigator.pop(context))
        ],
      ),
    );
  }
}
