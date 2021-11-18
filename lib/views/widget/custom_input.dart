import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatelessWidget {
  final bool? obscureText;
  final String? labelText;
  final String? hintText;
  final bool? underLineBorder;
  final TextInputType? keyboardType;
  final Color? borderColor;
  CustomInput(
      {Key? key,
      this.obscureText,
      this.labelText,
      this.keyboardType,
      this.hintText,
      this.underLineBorder = false,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        labelText != null
            ? CustomText(
                text: labelText!,
                fontSize: 11.sp,
              )
            : CustomText(text: ''),
        SizedBox(height: 10.h),
        TextField(
          cursorColor: AppColors.WHITH_COLOR,
          obscureText: obscureText ?? false,
          style: TextStyle(color: AppColors.WHITH_COLOR, fontSize: 15.sp),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.WHITH_COLOR),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.h),
            enabledBorder: underLineBorder == false
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.BUTTON_COLOR,
                    ),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.WHITH_COLOR),
                  ),
            focusedBorder: underLineBorder == false
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.WHITH_COLOR,
                    ),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.WHITH_COLOR),
                  ),
          ),
        ),
      ],
    );
  }
}
