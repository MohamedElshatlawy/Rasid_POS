import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class CustomGridView extends StatelessWidget {
  final List<Widget>? childrenList;
  CustomGridView({Key? key, this.childrenList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.all(7),
        crossAxisCount: 3,
        shrinkWrap: true,
        crossAxisSpacing: SizeConfig.blockSizeVertical,
        mainAxisSpacing: SizeConfig.blockSizeVertical,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 1.8,
        children: childrenList!);
  }
}
