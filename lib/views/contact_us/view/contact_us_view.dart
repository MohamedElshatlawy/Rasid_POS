import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_container_with_label.dart';
import 'package:rasid_jack/common/widgets/app_dropdown.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/common/widgets/app_label_with_icon.dart';
import 'package:rasid_jack/common/widgets/title_and_description.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/utilities.dart';
import 'package:rasid_jack/views/contact_us/bloc/contact_us_bloc.dart';

class ContactUsView extends BaseStatefulWidget {
  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends BaseState<ContactUsView> {
  ContactUsBloc _contactUsBloc = ContactUsBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical * 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleAndDescription(
                  label: AppLocalizations.of(context).contactUs,
                  descriptionLabel: '',
                ),
                SizedBox(
                  width: SizeConfig.padding,
                ),
                AppImage(
                    path: AppAssets.CONTACT_US1, width: SizeConfig.iconSize * 2)
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 7),
            AppTextFormFieldItem(
              title: AppLocalizations.of(context).userName,
              formFieldItemType: AppFormFieldItemType.TEXT,
              subject: _contactUsBloc.nameSubject,
              textInputType: TextInputType.text,
              fontColor: AppColors.WHITH_COLOR,
              labelFontColor: AppColors.WHITH_COLOR,
              borderColor: AppColors.DARK_GRAY_COLOR,
              focusedBorderColor: AppColors.WHITH_COLOR,
              iconColor: AppColors.GRAY_COLOR,
              focusedIconColor: AppColors.WHITH_COLOR,
              label: AppLabelWithIcon(
                icon: Icon(
                  Icons.star,
                  color: AppColors.accentColor,
                  size: SizeConfig.smallIconSize / 2,
                ),
                label: AppLocalizations.of(context).userName,
                labelColor: AppColors.greyLightColor,
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),
            AppTextFormFieldItem(
                title: AppLocalizations.of(context).phoneNumber,
                formFieldItemType: AppFormFieldItemType.NUMBER,
                subject: _contactUsBloc.phoneNumberSubject,
                textInputType: TextInputType.text,
                fontColor: AppColors.WHITH_COLOR,
                labelFontColor: AppColors.WHITH_COLOR,
                borderColor: AppColors.DARK_GRAY_COLOR,
                focusedBorderColor: AppColors.WHITH_COLOR,
                iconColor: AppColors.GRAY_COLOR,
                focusedIconColor: AppColors.WHITH_COLOR,
                label: AppLabelWithIcon(
                  icon: Icon(
                    Icons.star,
                    color: AppColors.accentColor,
                    size: SizeConfig.smallIconSize / 2,
                  ),
                  label: AppLocalizations.of(context).phoneNumber,
                  labelColor: AppColors.greyLightColor,
                )),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),
            StreamBuilder<City>(
                stream: _contactUsBloc.selectedBranchSubject.stream,
                builder: (context, AsyncSnapshot<City> snapshot) {
                  return StreamBuilder<Color>(
                      stream: _contactUsBloc
                          .branchContainerBorderColorSubject.stream,
                      builder: (context, snapshotBorderColor) {
                        return AppContainerWithLabel(
                          borderColor:
                              snapshotBorderColor.data ?? AppColors.GRAY_COLOR,
                          padding: EdgeInsets.zero,
                          label: AppLocalizations.of(context).contactUs,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.padding),
                            child: AppDropdown<City>(
                              hint: snapshot.data?.title ?? '',
                              titleKey: 'title',
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.WHITH_COLOR),
                              icon: AppImage(
                                path: AppAssets.DROPDOWN,
                                width: SizeConfig.smallIconSize,
                              ),
                              items: _contactUsBloc.list,
                              onTap: () => _contactUsBloc
                                  .setDropDownBorderColor(_contactUsBloc
                                      .branchContainerBorderColorSubject),
                              onChange: (value) {
                                _contactUsBloc.selectedBranchSubject.sink
                                    .add(snapshot.data!);
                              },
                              validator: (value) => value == null
                                  ? '${AppLocalizations.of(context).select} ${AppLocalizations.of(context).messageType}'
                                  : null,
                            ),
                          ),
                        );
                      });
                }),
            SizedBox(height: SizeConfig.blockSizeVertical * 3),
            AppTextFormFieldItem(
                title: AppLocalizations.of(context).yourMessage,
                formFieldItemType: AppFormFieldItemType.MULTI_TEXT,
                subject: _contactUsBloc.messageSubject,
                textInputType: TextInputType.multiline,
                fontColor: AppColors.WHITH_COLOR,
                labelFontColor: AppColors.WHITH_COLOR,
                borderColor: AppColors.DARK_GRAY_COLOR,
                focusedBorderColor: AppColors.WHITH_COLOR,
                iconColor: AppColors.GRAY_COLOR,
                maxLines: 4,
                focusedIconColor: AppColors.WHITH_COLOR,
                label: AppLabelWithIcon(
                  icon: Icon(
                    Icons.star,
                    color: AppColors.accentColor,
                    size: SizeConfig.smallIconSize / 2,
                  ),
                  label: AppLocalizations.of(context).yourMessage,
                  labelColor: AppColors.greyLightColor,
                )),
          ],
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? getAppbar() {
    // TODO: implement getAppbar
    return null;
  }

  @override
  Color getScaffoldBackgroundColor() {
    // TODO: implement getScaffoldBackgroundColor
    return AppColors.blackBGColor;
  }

  // @override
  // String getScaffoldBackgroundImage() {
  //   // TODO: implement getScaffoldBackgroundImage
  //   return AppAssets.CONTACT_US_BG;
  // }
  @override
  bool getResizeToAvoidBottomInset() {
    // TODO: implement getResizeToAvoidBottomInset
    return true;
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
}
