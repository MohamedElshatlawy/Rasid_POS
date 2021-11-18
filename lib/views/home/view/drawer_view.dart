import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/buy_with_cash/view/buy_view.dart';
import 'package:rasid_jack/views/commissions/view/commission_view.dart';
import 'package:rasid_jack/views/contactUs/view/contact_us_view.dart';
import 'package:rasid_jack/views/purchase/view/purchase_view.dart';
import 'package:rasid_jack/views/widget/custom_button.dart';
import 'package:rasid_jack/views/widget/custom_listtile.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';

class DrawerView extends BaseStatefulWidget {
  final ValueChanged? onSelectedItem;
  DrawerView({this.onSelectedItem});
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends BaseState<DrawerView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      padding: EdgeInsets.only(right: 130.w, left: 20.w),
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/Rectangle.png'),
      )),
      width: double.infinity,
      height: double.infinity,
      child: Drawer(
        elevation: 0.0,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 2),
          children: [
            _drawerHeader(),
            SizedBox(height: 20.h),
            _customListWidget(Icons.shopping_basket_outlined, 'عمليه الشراء',
                () {
              ZoomDrawer.of(context)!.close();
            }),
            _customListWidget(Icons.public_rounded, 'شراء مع نقد', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BuyWithCashView()));
            }),
            _customListWidget(Icons.note_outlined, 'العمليات', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PurchaseView()));
            }),
            _customListWidget(Icons.money, 'العمولات', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CommissionView()));
            }),
            _customListWidget(Icons.camera_alt_outlined, 'الربط', () {}),
            _customListWidget(Icons.settings_cell_outlined, 'تواصل معانا', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactUsView()));
            }),
            Divider(color: AppColors.GRAY_COLOR, indent: 100.w),
            SizedBox(height: 10.h),
            CustomButton(
              buttonText: 'الدعم المباشر',
              buttonColor: Colors.white,
              textColor: AppColors.PINK_COLOR,
            )
          ],
        ),
      ),
    );
  }

  Widget iconContainer(Widget icon, Color containerColor, Color iconColor,
      double height, width, iconSize, Function() press) {
    return Container(
      child: IconButton(
        icon: icon,
        color: iconColor,
        iconSize: iconSize,
        onPressed: press,
      ),
      height: height,
      width: width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(10.r)),
    );
  }

  Widget _drawerHeader() {
    return Container(
      height: 320.h,
      child: DrawerHeader(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            iconContainer(Icon(Icons.close), AppColors.WHITH_COLOR,
                AppColors.DARK_GRAY_COLOR, 46.h, 41.w, 20.0, () {
              ZoomDrawer.of(context)!.close();
            }),
            SizedBox(height: 15.h),
            iconContainer(
                Icon(Icons.person_outline_rounded),
                AppColors.DARK_GRAY_COLOR,
                AppColors.WHITH_COLOR,
                87.h,
                87.w,
                40.0,
                () {}),
            Padding(
              padding: EdgeInsets.only(right: 100),
              child: CustomText(text: 'اسم المستخدم', fontSize: 30.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customListWidget(IconData icon, String title, Function() press) {
    return CustomListTile(
      trailing: Icon(
        icon,
        color: AppColors.WHITH_COLOR,
      ),
      title: CustomText(text: title),
      press: press,
    );
  }
}
