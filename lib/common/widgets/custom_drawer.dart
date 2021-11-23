import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/buy_with_cash/view/buy_view.dart';
import 'package:rasid_jack/views/commissions/view/commission_view.dart';
import 'package:rasid_jack/views/contactUs/view/contact_us_view.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rasid_jack/views/purchase/view/purchase_view.dart';
import 'package:rasid_jack/common/widgets/custom_listtile.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppAssets.loginBackground),
          ),
        ),
        child: ListView(children: [
          DrawerHeader(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Image.asset(AppAssets.profileButton),
                  iconSize: SizeConfig.btnHeight,
                  onPressed: null,
                ),
                SizedBox(height: SizeConfig.padding),
                CustomText(
                    text: 'اسم المستخدم', fontSize: SizeConfig.titleFontSize),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.padding),
          CustomListTile(
            trailing: Icon(
              Icons.shopping_basket_outlined,
              color: AppColors.WHITH_COLOR,
            ),
            title: CustomText(text: 'عمليه الشراء'),
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeView()));
            },
          ),
          CustomListTile(
            trailing: Icon(
              Icons.public_rounded,
              color: AppColors.WHITH_COLOR,
            ),
            title: CustomText(text: 'شراء مع نقد'),
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BuyWithCashView()));
            },
          ),
          CustomListTile(
            trailing: Icon(
              Icons.note_outlined,
              color: AppColors.WHITH_COLOR,
            ),
            title: CustomText(text: 'العمليات'),
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PurchaseView()));
            },
          ),
          CustomListTile(
            trailing: Icon(
              Icons.money,
              color: AppColors.WHITH_COLOR,
            ),
            title: CustomText(text: 'العمولات'),
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CommissionView()));
            },
          ),
          CustomListTile(
            trailing: Icon(
              Icons.camera_alt_outlined,
              color: AppColors.WHITH_COLOR,
            ),
            title: CustomText(text: 'الربط'),
            press: () {},
          ),
          CustomListTile(
            trailing: Icon(
              Icons.settings_cell_outlined,
              color: AppColors.WHITH_COLOR,
            ),
            title: CustomText(text: 'تواصل معانا'),
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactUsView()));
            },
          ),
        ]),
      ),
    );
  }
}
