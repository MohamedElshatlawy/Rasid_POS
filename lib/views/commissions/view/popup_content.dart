import 'package:flutter/material.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_dropdown.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/commissions/bloc.dart/commission_bloc.dart';
import 'package:rxdart/rxdart.dart';

class PopUpContent extends StatelessWidget {
  CommissionBloc bloc;
  PopUpContent({required this.bloc});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.padding * 5),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.padding, vertical: SizeConfig.padding),
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
                  style: AppFontStyle.bahijSansArabic(
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
            child: StreamBuilder(
                stream: bloc.dropdownValuesStream,
                builder: (context, AsyncSnapshot snapshot) {
                  print("object${snapshot.data}");
                  return AppDropdown(
                      titleKey: bloc.initalVal.toString(),
                      style: AppFontStyle.bahijSansArabic(
                          fontSize: SizeConfig.textFontSize,
                          fontColor: AppColors.whiteColor),
                      hint: "اسم البنك",
                      items: snapshot.data ?? [],
                      onChange: (val) {
                        bloc.selectedITem(val['item']);
                      },
                      validator: (dynamic valid) {});
                }),
          ),
          SizedBox(height: SizeConfig.padding),
          AppTextFormFieldItem(
              title: AppLocalizations.of(context).numberofstatement,
              formFieldItemType: AppFormFieldItemType.NUMBER,
              label: AppText(
                  label: AppLocalizations.of(context).numberofstatement,
                  style: AppFontStyle.bahijSansArabic(
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
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).sendOrder,
              borderColor: AppColors.BUTTON_COLOR,
              backgroundColor: AppColors.BUTTON_COLOR,
              onTap: () => showAppDialog(
                  title: '',
                  errorMessage: '',
                  cancelButtonTitle: AppLocalizations.of(context).back,
                  okButtonTitle: '',
                  context: context)),
          SizedBox(height: SizeConfig.padding),
        ],
      ),
    );
  }

  Future<void> showAppDialog(
      {required String title,
      required String errorMessage,
      required String okButtonTitle,
      String? cancelButtonTitle,
      required BuildContext context}) async {
    return showDialog(
        builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.transparent,
            actions: [
              AppButton(
                  width: double.infinity,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor),
                  title: cancelButtonTitle.toString(),
                  borderColor: AppColors.PINK_COLOR,
                  backgroundColor: AppColors.PINK_COLOR,
                  onTap: () => Navigator.pop(context)),
            ],
            content: Container(
              margin: EdgeInsets.symmetric(vertical: SizeConfig.padding * 8),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.padding,
                  vertical: SizeConfig.padding * 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.DARK_GRAY_COLOR,
              ),
              child: AppText(
                label: AppLocalizations.of(context).commissionDilalog,
                style: AppFontStyle.bahijSansArabic(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
              ),
            )),
        context: context);
  }
}
