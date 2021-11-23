import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

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
    SizeConfig().init(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        labelText != null
            ? CustomText(
                text: labelText!,
              )
            : CustomText(text: ''),
        SizedBox(height: SizeConfig.safeBlockHorizontal),
        TextField(
          cursorColor: AppColors.WHITH_COLOR,
          obscureText: obscureText ?? false,
          style: TextStyle(
              color: AppColors.WHITH_COLOR, fontSize: SizeConfig.textFontSize),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.WHITH_COLOR),
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal),
            enabledBorder: underLineBorder == false
                ? OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRaduis),
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
