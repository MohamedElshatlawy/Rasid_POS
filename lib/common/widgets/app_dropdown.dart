import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/helper_methods.dart';
import 'package:rasid_jack/utilities/size_config.dart';

import 'app_text.dart';

class AppDropdown<T> extends StatelessWidget {
  final String? title;
  final String titleKey;
  final String? hint;
  final List<T> items;
  final T? selectedItem;
  final ValueChanged onChange;
  final FormFieldValidator<T> validator;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  const AppDropdown(
      {Key? key,
      this.title,
      required this.titleKey,
      this.hint,
      required this.items,
      this.selectedItem,
      required this.onChange,
      required this.validator,
      this.style,
      this.icon,
      this.iconColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppColors.blackBGColor,
      ),
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        value: null,
        //selectedItem
        validator: validator,
        hint: AppText(
          label: hint ?? '',
          style: style ??
              AppFontStyle.bahijSemiBold(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.fontColor),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8)),
        icon: icon ??
            Icon(
              Icons.keyboard_arrow_down,
              size: SizeConfig.iconSize,
              color: iconColor ?? AppColors.blackColor,
            ),
        onTap: onTap,
        items: items.map((T data) {
          var map = Map<String, dynamic>.from(json.decode(json.encode(data)));

          return DropdownMenuItem(
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 100,
              child: AppText(
                label: '${map[titleKey] ?? ''}',
                style: style ??
                    AppFontStyle.bahijSemiBold(
                        fontSize: SizeConfig.textFontSize,
                        fontColor: AppColors.fontColor),
              ),
            ),
            value: data,
          );
        }).toList(),
        onChanged: onChange,
      ),
    );
  }
}
