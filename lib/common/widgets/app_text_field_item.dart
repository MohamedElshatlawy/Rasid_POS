// import 'package:flutter/material.dart';
// import 'package:rasid_jack/utilities/constants/app_assets.dart';
// import 'package:rasid_jack/utilities/constants/app_colors.dart';
// import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
// import 'package:rasid_jack/utilities/size_config.dart';
// import 'package:rasid_jack/utilities/validations.dart';
// import 'package:rxdart/rxdart.dart';
//
// import 'app_text_form_field_item.dart';
//
// class AppTextFieldItem extends StatelessWidget with Validations {
//   final TextEditingController controller;
//   final String title;
//   final AppFormFieldItemType formFieldItemType;
//   final BehaviorSubject subject;
//   final BehaviorSubject<bool> obscureTextSubject;
//   final FocusNode? focusNode;
//   final TextInputType textInputType;
//   final Color? fontColor;
//   final Widget? label;
//   final Color labelFontColor;
//   final Color borderColor;
//   final Color focusedBorderColor;
//   final Color iconColor;
//   final Color focusedIconColor;
//   final int? maxLines;
//   final GestureTapCallback? onTap;
//
//   const AppTextFieldItem({
//     required this.controller,
//     required this.title,
//     required this.formFieldItemType,
//     required this.subject,
//     required this.obscureTextSubject,
//     this.focusNode,
//     required this.textInputType,
//     this.fontColor,
//     this.label,
//     required this.labelFontColor,
//     required this.borderColor,
//     required this.focusedBorderColor,
//     required this.iconColor,
//     required this.focusedIconColor,
//     this.maxLines,
//     this.onTap,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: subject.stream,
//         builder: (context, snapshot) {
//           return StreamBuilder(
//               stream: obscureTextSubject.stream,
//               builder: (context, obscureTextSnapshot) {
//                 return TextField(
//                   onTap: onTap,
//                   controller: controller,
//                   cursorColor: focusedBorderColor,
//                   focusNode: focusNode,
//                   autofocus: true,
//                   maxLines: formFieldItemType == AppFormFieldItemType.MULTI_TEXT
//                       ? maxLines
//                       : 1,
//                   style: AppFontStyle.bahijBold(
//                       fontSize: SizeConfig.titleFontSize,
//                       fontColor: fontColor ?? AppColors.blackColor),
//                   obscureText:
//                       formFieldItemType == AppFormFieldItemType.PASSWORD &&
//                               obscureTextSubject.value
//                           ? true
//                           : false,
//                   keyboardType: textInputType,
//                   onChanged: (String input) {
//                     subject.sink.add(input);
//                   },
//                   decoration: InputDecoration(
//                     suffixIcon: formFieldItemType ==
//                             AppFormFieldItemType.PASSWORD
//                         ? Container(
//                             width: 60,
//                             height: 20,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 15),
//                                   child: VerticalDivider(
//                                     width: 1,
//                                     color: AppColors.whiteColor,
//                                   ),
//                                 ),
//                                 IconButton(
//                                     onPressed: () {
//                                       print(obscureTextSubject.value);
//                                       obscureTextSubject.sink
//                                           .add(!obscureTextSubject.value);
//                                     },
//                                     icon: Image.asset(
//                                       AppAssets.eye,
//                                       color: obscureTextSnapshot.data == true
//                                           ? borderColor
//                                           : focusedBorderColor,
//                                       width: 18.21,
//                                       height: 14.5,
//                                     )),
//                               ],
//                             ),
//                           )
//                         : SizedBox(),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(width: 2, color: focusedBorderColor),
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(width: 2, color: borderColor),
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(SizeConfig.btnRadius))),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(width: 2, color: borderColor),
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(SizeConfig.btnRadius))),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 24),
//                     labelStyle: AppFontStyle.bahijSemiBold(
//                         fontSize: SizeConfig.titleFontSize,
//                         fontColor: labelFontColor),
//                     floatingLabelBehavior: FloatingLabelBehavior.always,
//                     label: label,
//                     errorStyle: AppFontStyle.bahijLight(
//                         fontSize: SizeConfig.smallTextFontSize,
//                         fontColor: AppColors.redColor),
//                   ),
//                 );
//               });
//         });
//   }
// }
