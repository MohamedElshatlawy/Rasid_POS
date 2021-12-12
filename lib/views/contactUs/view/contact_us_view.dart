import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_divider.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';

class ContactUsView extends BaseStatefulWidget {
  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends BaseState<ContactUsView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.chaserLogin), fit: BoxFit.cover)),
      padding: EdgeInsets.all(SizeConfig.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.padding * 5),
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
          SizedBox(height: SizeConfig.extraPadding),
          AppText(
              label: 'supprted@rasid.com',
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor)),
          AppText(
              label: '483828282',
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor)),
          AppDivider(),
          AppText(
              label: AppLocalizations.of(context).accountManager,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor)),
          AppText(
              label: 'سليمان العتيق',
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor)),
          AppText(
              label: '05XXXXXXXXXXXX',
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor)),
        ],
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
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).liveSupport,
              borderColor: AppColors.WHITH_COLOR,
              backgroundColor: AppColors.BUTTON_COLOR,
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeView()))),
          SizedBox(height: SizeConfig.padding),
          AppButton(
              width: double.infinity,
              title: AppLocalizations.of(context).back,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              borderColor: AppColors.PINK_COLOR,
              backgroundColor: AppColors.PINK_COLOR,
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
