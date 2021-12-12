import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class CustomListTile extends StatelessWidget {
  final Widget? trailing, leading;
  final Widget? title;
  final Function()? press;
  final EdgeInsetsGeometry? padding;
  final bool? itemSelected;
  CustomListTile({
    Key? key,
    this.trailing,
    this.title,
    this.press,
    this.padding,
    this.itemSelected = false,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: ListTile(
        selected: itemSelected!,
        contentPadding: EdgeInsets.zero,
        onTap: press,
        title: title,
        trailing: trailing,
        leading: leading,
      ),
    );
  }
}
