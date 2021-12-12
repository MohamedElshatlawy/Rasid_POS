import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/validations.dart';
import 'package:rxdart/rxdart.dart';

enum AppFormFieldItemType {
  EMAIL,
  PASSWORD,
  NUMBER,
  TEXT,
  PHONE,
  MULTI_TEXT,
  USER_NAME,
  USER_NAME_OR_EMAIL,
  FIRST_NAME,
  LAST_NAME,
  SEARCH,
}

class AppTextFormFieldItem extends StatelessWidget with Validations {
  final TextEditingController? controller;
  final String title;
  final AppFormFieldItemType formFieldItemType;
  final BehaviorSubject subject;
  final BehaviorSubject<bool>? obscureTextSubject;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final Color? fontColor;
  final Widget? label;
  final Color labelFontColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color iconColor;
  final Color focusedIconColor;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool? showHint;
  final bool? showUnderLine;

  const AppTextFormFieldItem({
    this.controller,
    required this.title,
    required this.formFieldItemType,
    required this.subject,
    this.obscureTextSubject,
    this.focusNode,
    required this.textInputType,
    this.fontColor,
    this.label,
    required this.labelFontColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.iconColor,
    required this.focusedIconColor,
    this.maxLines,
    this.onTap,
    this.validator,
    this.showHint = false,
    this.showUnderLine = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: subject.stream,
        builder: (context, snapshot) {
          return formFieldItemType == AppFormFieldItemType.PASSWORD &&
                  obscureTextSubject != null
              ? StreamBuilder(
                  stream: obscureTextSubject!.stream,
                  builder: (context, obscureTextSnapshot) {
                    return passwordTextFormField(
                        context: context,
                        obscureTextSnapshot:
                            obscureTextSnapshot.data == true ? true : false);
                  })
              : textFormField(context: context);
        });
  }

  TextFormField passwordTextFormField(
      {required BuildContext context, required bool obscureTextSnapshot}) {
    return TextFormField(
        onTap: onTap,
        controller: controller,
        cursorColor: focusedBorderColor,
        focusNode: focusNode,
        autofocus: true,
        maxLines: 1,
        style: AppFontStyle.bahijSansArabic(
            fontSize: SizeConfig.titleFontSize,
            fontColor: fontColor ?? AppColors.BLACK_COLOR),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: formFieldItemType == AppFormFieldItemType.PASSWORD &&
                obscureTextSubject!.value
            ? true
            : false,
        keyboardType: textInputType,
        onChanged: (String input) {
          subject.sink.add(input);
        },
        decoration: InputDecoration(
          suffixIcon: formFieldItemType == AppFormFieldItemType.PASSWORD
              ? Container(
                  width: 60,
                  height: 20,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: VerticalDivider(
                          width: 1,
                          color: AppColors.WHITH_COLOR,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            print(obscureTextSubject!.value);
                            obscureTextSubject!.sink
                                .add(!obscureTextSubject!.value);
                          },
                          icon: Image.asset(
                            AppAssets.eye,
                            color: obscureTextSnapshot
                                ? borderColor
                                : focusedBorderColor,
                            width: 18.21,
                            height: 14.5,
                          )),
                    ],
                  ),
                )
              : SizedBox(),
          focusedBorder: showUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: labelFontColor))
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: focusedBorderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: showUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: labelFontColor))
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: borderColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeConfig.btnRadius))),
          border: showUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: labelFontColor))
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: borderColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeConfig.btnRadius))),
          contentPadding: EdgeInsets.symmetric(horizontal: 24),
          labelStyle: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.titleFontSize, fontColor: labelFontColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: label,
          hintText: showHint == true ? title : '',
          hintStyle: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.titleFontSize, fontColor: labelFontColor),
          errorText: subject.hasError ? subject.stream.error.toString() : null,
          errorStyle: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.smallTextFontSize,
              fontColor: AppColors.RED_COLOR),
        ),
        validator: validator);
  }

  TextFormField textFormField({required BuildContext context}) {
    return TextFormField(
        onTap: onTap,
        controller: controller,
        cursorColor: focusedBorderColor,
        focusNode: focusNode,
        autofocus: true,
        maxLines:
            formFieldItemType == AppFormFieldItemType.MULTI_TEXT ? maxLines : 1,
        style: AppFontStyle.bahijSansArabic(
            fontSize: SizeConfig.titleFontSize,
            fontColor: fontColor ?? AppColors.BLACK_COLOR),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: formFieldItemType == AppFormFieldItemType.PASSWORD &&
                obscureTextSubject!.value
            ? true
            : false,
        keyboardType: textInputType,
        onChanged: (String input) {
          subject.sink.add(input);
        },
        decoration: InputDecoration(
          focusedBorder: showUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: labelFontColor))
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: focusedBorderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: showUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: labelFontColor))
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: borderColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeConfig.btnRadius))),
          border: showUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: labelFontColor))
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: borderColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeConfig.btnRadius))),
          contentPadding: EdgeInsets.symmetric(horizontal: 24),
          labelStyle: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.titleFontSize, fontColor: labelFontColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: label,
          hintText: showHint == true ? title : '',
          hintStyle: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.titleFontSize, fontColor: labelFontColor),
          errorText: subject.hasError ? subject.stream.error.toString() : null,
          errorStyle: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.smallTextFontSize,
              fontColor: AppColors.RED_COLOR),
        ),
        validator: validator);
  }
}
