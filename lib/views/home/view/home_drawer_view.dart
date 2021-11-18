import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/home/view/drawer_view.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';

class HomeDrawerView extends BaseStatefulWidget {
  @override
  _HomeDrawerViewState createState() => _HomeDrawerViewState();
}

class _HomeDrawerViewState extends BaseState<HomeDrawerView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return ZoomDrawer(
        style: DrawerStyle.Style1,
        borderRadius: 50.r,
        angle: -15,
        showShadow: true,
        backgroundColor: AppColors.LIGHT_GRAY_COLOR,
        menuScreen: DrawerView(
            // onSelectedItem: (item) {
            //   setState(() {
            //     this.menuItem = item;
            //   });
            // ZoomDrawer.of(context)!.close();
            // },
            ),
        mainScreen: HomeView());
  }
}
