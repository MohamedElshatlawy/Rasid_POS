import 'package:flutter/material.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';

class CustomPressedText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Function()? pressText;
  CustomPressedText({Key? key, this.text, this.pressText, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pressText,
      child: CustomText(
          text: text!, textColor: textColor ?? AppColors.WHITH_COLOR),
    );
  }
}
