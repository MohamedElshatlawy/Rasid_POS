import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/size_config.dart';

import 'app_text.dart';

enum AppButtonAlign { START, CENTER, END, DEFAULT }

class AppButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final TextStyle? style;
  final Color borderColor;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final VoidCallback onTap;
  final AppButtonAlign? alignment;

  const AppButton(
      {Key? key,
      required this.title,
      this.icon,
      this.style,
      required this.borderColor,
      required this.backgroundColor,
      this.width,
      this.height,
      this.radius,
      required this.onTap,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? SizeConfig.btnHeight,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          primary: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? SizeConfig.btnRadius))),
          side: BorderSide(color: borderColor, width: 2),
        ),
        autofocus: true,
        child: btn(),
        onPressed: onTap,
      ),
    );
  }

  Widget btn() {
    if (icon != null && title.isEmpty) {
      return icon!;
    } else if (alignment != null) {
      switch (alignment!) {
        case AppButtonAlign.START:
          // TODO: Handle this case.
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: SizeConfig.padding),
              if (icon != null) icon!,
              if (icon != null) SizedBox(width: SizeConfig.padding),
              _title(),
            ],
          );
        case AppButtonAlign.CENTER:
          // TODO: Handle this case.
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              if (icon != null) SizedBox(width: SizeConfig.padding),
              if (icon != null) icon!,
            ],
          );
        case AppButtonAlign.END:
          // TODO: Handle this case.
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              if (icon != null) SizedBox(width: SizeConfig.padding),
              if (icon != null) icon!,
            ],
          );
        case AppButtonAlign.DEFAULT:
          // TODO: Handle this case.
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              if (icon != null) SizedBox(width: SizeConfig.padding),
              if (icon != null) icon!,
            ],
          );
      }
    }else{
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _title(),
          if (icon != null) SizedBox(width: SizeConfig.padding),
          if (icon != null) icon!,
        ],
      );
    }
  }

  Widget _title() {
    return AppText(
      label: title,
      style: style ??
          AppFontStyle.bahijSemiBold(
              fontSize: SizeConfig.textFontSize,
              fontColor: AppColors.fontColor,
              textDecoration: TextDecoration.none),
    );
  }
}
