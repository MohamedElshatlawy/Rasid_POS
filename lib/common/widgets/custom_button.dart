import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

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
    SizeConfig().init(context);

    return Container(
      height: SizeConfig.btnHeight,
      width: SizeConfig.screenWidth,
      child: RawMaterialButton(
        onPressed: press,
        child: CustomText(
          text: buttonText,
          fontSize: fontSize ?? SizeConfig.textFontSize,
          textColor: textColor,
        ),
        fillColor: buttonColor ?? AppColors.BUTTON_COLOR,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConfig.borderRaduis),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
      ),
    );
  }
}
