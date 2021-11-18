import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/widget/custom_button.dart';
import 'package:rasid_jack/views/widget/custom_input.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';

class CommissionView extends BaseStatefulWidget {
  @override
  _CommissionViewState createState() => _CommissionViewState();
}

class _CommissionViewState extends BaseState<CommissionView> {
  String value = 'اسم البنك';

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.BLACK_COLOR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(text: 'العمولات', fontSize: 35.sp),
              SizedBox(width: 20.w),
              Image.asset('assets/images/Icon-crown.png')
            ],
          ),
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppColors.PINK_COLOR, shape: BoxShape.circle),
              child: _customContainer()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomButton(
                buttonText: 'سحب العمولات',
                borderColor: AppColors.WHITH_COLOR,
                press: () => showAppDialog(
                    title: '',
                    errorMessage: '',
                    okButtonTitle: '',
                    cancelButtonTitle: 'رحوع',
                    content: _sendOrderPopUp()),
                fontSize: 20.sp,
                buttonColor: AppColors.BUTTON_COLOR),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }

  Widget iconContainer(Widget icon, Function() press) {
    return Container(
      child: IconButton(
        icon: icon,
        color: AppColors.BLACK_COLOR,
        iconSize: 30.sp,
        onPressed: press,
      ),
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: AppColors.WHITH_COLOR,
          borderRadius: BorderRadius.circular(10.r)),
    );
  }

  Widget _customContainer() {
    return Container(
      padding: EdgeInsets.all(70),
      decoration: BoxDecoration(
          color: AppColors.DARK_GRAY_COLOR, shape: BoxShape.circle),
      child: Column(
        children: [
          CustomText(text: '100', fontSize: 30),
          CustomText(text: 'ريال', fontSize: 30),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget getAppbar() {
    return AppBar(
      actions: [iconContainer(Icon(Icons.close), () => Navigator.pop(context))],
      leading: CustomText(text: ''),
      backgroundColor: AppColors.BLACK_COLOR,
      elevation: 0.0,
    );
  }

  @override
  Future<void> showAppDialog(
      {required String title,
      required String errorMessage,
      required String okButtonTitle,
      String? cancelButtonTitle,
      Widget? content}) async {
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
              content: content,
            ));
  }

  Widget _dropDownWidget() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.WHITH_COLOR),
          borderRadius: BorderRadius.circular(10.r)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconEnabledColor: AppColors.WHITH_COLOR,
          isExpanded: true,
          items: <String>['اسم البنك', 'B', 'C', 'D']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(text: value),
              ),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              value = val!;
            });
          },
          value: value,
          dropdownColor: AppColors.DARK_GRAY_COLOR,
        ),
      ),
    );
  }

  Widget _sendOrderPopUp() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.DARK_GRAY_COLOR),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomInput(hintText: 'الاسم', borderColor: AppColors.WHITH_COLOR),
          SizedBox(height: 30.h),
          _dropDownWidget(),
          CustomInput(
              hintText: 'رقم البيان', borderColor: AppColors.WHITH_COLOR),
          SizedBox(height: 30.h),
          CustomButton(
            buttonText: 'ارسال طلب السحب',
            buttonColor: AppColors.BUTTON_COLOR,
            press: () => showAppDialog(
                title: '',
                errorMessage: '',
                okButtonTitle: '',
                cancelButtonTitle: 'رجوع',
                content: _pullCommissionPopUp()),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _pullCommissionPopUp() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.DARK_GRAY_COLOR,
      ),
      child: CustomText(
        text: 'يمكنك سحب العموله في حاله وصول قيمتها الي 1000 ريال',
        fontSize: 20.sp,
      ),
    );
  }
}
