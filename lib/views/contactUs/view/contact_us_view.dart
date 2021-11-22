import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rasid_jack/common/widgets/custom_button.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

class ContactUsView extends BaseStatefulWidget {
  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends BaseState<ContactUsView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Padding(
      padding: EdgeInsets.all(SizeConfig.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'تواصل معنا',
                fontSize: SizeConfig.titleFontSize,
              ),
              SizedBox(width: SizeConfig.padding),
              Image.asset(AppAssets.contactUsImage)
            ],
          ),
          SizedBox(height: SizeConfig.extraPadding),
          CustomText(
              text: 'supprted@rasid.com', fontSize: SizeConfig.titleFontSize),
          CustomText(text: '483828282', fontSize: SizeConfig.titleFontSize),
          Divider(color: AppColors.GRAY_COLOR),
          CustomText(text: 'مدير الحساب', fontSize: SizeConfig.titleFontSize),
          CustomText(text: 'سليمان العتيق', fontSize: SizeConfig.titleFontSize),
          CustomText(
              text: '05XXXXXXXXXXXX', fontSize: SizeConfig.titleFontSize),
          Divider(color: AppColors.GRAY_COLOR),
          SizedBox(height: SizeConfig.extraPadding * 1.3),
          CustomButton(
              buttonText: 'الدعم المباشر',
              press: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeView())),
              borderColor: AppColors.WHITH_COLOR),
        ],
      ),
    );
  }
}
