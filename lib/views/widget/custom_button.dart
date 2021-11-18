import 'package:flutter/material.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? press;
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final Color? borderColor;
  CustomButton(
      {Key? key,
      this.press,
      required this.buttonText,
      this.buttonColor,
      this.textColor,
      this.fontSize,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 428.w,
      child: RawMaterialButton(
        onPressed: press,
        child: CustomText(
          text: buttonText,
          fontSize: fontSize ?? 14.sp,
          textColor: textColor,
        ),
        fillColor: buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
      ),
    );
  }
}
