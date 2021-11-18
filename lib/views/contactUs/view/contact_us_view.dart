import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/widget/custom_button.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';

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
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/Rectangle.png'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'تواصل معنا',
                fontSize: 30.sp,
              ),
              SizedBox(width: 10.w),
              Image.asset('assets/images/rrr.png')
            ],
          ),
          SizedBox(height: 100.h),
          _containerWithUnderLine('', 'supprted@rasid.com', '483828282'),
          _containerWithUnderLine(
              'مدير الحساب', 'سليمان العتيق', '05XXXXXXXXXXXXXXXX'),
          SizedBox(height: 200.h),
          CustomButton(
              buttonText: 'الدعم المباشر',
              buttonColor: AppColors.BUTTON_COLOR,
              borderColor: AppColors.WHITH_COLOR),
        ],
      ),
    );
  }

  Widget _containerWithUnderLine(String text1, text2, text3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: text1, fontSize: 30.sp),
        CustomText(text: text2, fontSize: 30.sp),
        CustomText(text: text3, fontSize: 30.sp),
        Divider(color: AppColors.GRAY_COLOR),
      ],
    );
  }
}
