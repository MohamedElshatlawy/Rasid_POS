import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_divider.dart';
import 'package:rasid_jack/common/widgets/app_dropdown.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/contactUs/view/bloc/contact_us_bloc.dart';
import 'package:rxdart/rxdart.dart';

class FirstContactUsView extends BaseStatefulWidget {
  @override
  _FirstContactUsViewState createState() => _FirstContactUsViewState();
}

class _FirstContactUsViewState extends BaseState<FirstContactUsView> {
  ContactUsBloc bloc = ContactUsBloc(names: [
    {"item": "Thomas"},
    {"item": "John"},
    {"item": "Mary"}
  ]);
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.padding * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                    label: AppLocalizations.of(context).contactUs,
                    style: AppFontStyle.bahijSansArabic(
                        fontSize: SizeConfig.titleFontSize,
                        fontColor: AppColors.whiteColor)),
                SizedBox(width: SizeConfig.padding),
                AppImage(path: AppAssets.contactUsImage, boxFit: BoxFit.fill)
              ],
            ),
            AppText(
                label: AppLocalizations.of(context).userData,
                style: AppFontStyle.bahijSansArabic(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor)),
            SizedBox(height: SizeConfig.padding),
            AppTextFormFieldItem(
                label: AppText(
                    label: AppLocalizations.of(context).userName,
                    style: AppFontStyle.bahijSansArabic(
                        fontSize: SizeConfig.titleFontSize,
                        fontColor: AppColors.whiteColor)),
                title: '',
                formFieldItemType: AppFormFieldItemType.PHONE,
                subject: BehaviorSubject(),
                textInputType: TextInputType.phone,
                labelFontColor: AppColors.whiteColor,
                borderColor: AppColors.greyColor,
                focusedBorderColor: AppColors.whiteColor,
                fontColor: AppColors.whiteColor,
                iconColor: Colors.transparent,
                focusedIconColor: Colors.transparent),
            SizedBox(height: SizeConfig.padding * 2),
            AppTextFormFieldItem(
                label: AppText(
                    label: AppLocalizations.of(context).hobby,
                    style: AppFontStyle.bahijSansArabic(
                        fontSize: SizeConfig.titleFontSize,
                        fontColor: AppColors.whiteColor)),
                title: '',
                formFieldItemType: AppFormFieldItemType.PHONE,
                subject: BehaviorSubject(),
                textInputType: TextInputType.phone,
                labelFontColor: AppColors.whiteColor,
                borderColor: AppColors.greyColor,
                focusedBorderColor: AppColors.whiteColor,
                fontColor: AppColors.whiteColor,
                iconColor: Colors.transparent,
                focusedIconColor: Colors.transparent),
            SizedBox(height: SizeConfig.padding),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor, width: 3),
                  borderRadius: BorderRadius.circular(10)),
              child: StreamBuilder(
                  stream: bloc.dropdownValuesStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    print("object${snapshot.data}");
                    return AppDropdown(
                        iconColor: AppColors.WHITH_COLOR,
                        titleKey: bloc.initalVal.toString(),
                        style: AppFontStyle.bahijSansArabic(
                            fontSize: SizeConfig.textFontSize,
                            fontColor: AppColors.whiteColor),
                        hint: AppLocalizations.of(context).contactUs,
                        items: snapshot.data ?? [],
                        onChange: (val) {
                          bloc.selectedITem(val['item']);
                        },
                        validator: (dynamic valid) {});
                  }),
            ),
            SizedBox(height: SizeConfig.padding * 2),
            AppTextFormFieldItem(
                maxLines: 3,
                label: AppText(
                    label: AppLocalizations.of(context).sendInquiry,
                    style: AppFontStyle.bahijSansArabic(
                        fontSize: SizeConfig.titleFontSize,
                        fontColor: AppColors.whiteColor)),
                title: '',
                formFieldItemType: AppFormFieldItemType.MULTI_TEXT,
                subject: BehaviorSubject(),
                textInputType: TextInputType.phone,
                labelFontColor: AppColors.whiteColor,
                borderColor: AppColors.greyColor,
                focusedBorderColor: AppColors.whiteColor,
                fontColor: AppColors.whiteColor,
                iconColor: Colors.transparent,
                focusedIconColor: Colors.transparent),
            SizedBox(height: SizeConfig.padding * 5),
          ],
        ),
      ),
    );
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
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).send,
              borderColor: AppColors.WHITH_COLOR,
              backgroundColor: AppColors.DARK_GRAY_COLOR,
              onTap: () {}),
          SizedBox(height: SizeConfig.padding),
          AppButton(
              width: double.infinity,
              title: AppLocalizations.of(context).cancel,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.whiteColor),
              borderColor: AppColors.PINK_COLOR,
              backgroundColor: AppColors.PINK_COLOR,
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  @override
  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }
}
