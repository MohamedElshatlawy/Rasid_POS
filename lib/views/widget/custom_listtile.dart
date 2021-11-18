import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? trailing;
  final Widget? title;
  final Function()? press;
  final EdgeInsetsGeometry? padding;
  CustomListTile({
    Key? key,
    this.trailing,
    this.title,
    this.press,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(right: 60),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: press,
        title: title,
        trailing: trailing,
      ),
    );
  }
}
