import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/custom_listtile.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/buy_with_cash/view/buy_view.dart';
import 'package:rasid_jack/views/commissions/view/commission_view.dart';
import 'package:rasid_jack/views/contactUs/view/contact_us_view.dart';
import 'package:rasid_jack/views/contactUs/view/first_contact_us_view.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rasid_jack/views/transactions/view/transactions_view.dart';

class MainScreenView extends BaseStatefulWidget {
  @override
  _MainScreenViewState createState() => _MainScreenViewState();
}

class _MainScreenViewState extends BaseState<MainScreenView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.mainPic), fit: BoxFit.fill)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: AppImage(path: AppAssets.profileButton),
                      iconSize: SizeConfig.btnHeight,
                      onPressed: null,
                    ),
                    SizedBox(height: SizeConfig.padding),
                    AppText(
                        label: AppLocalizations.of(context).userName,
                        style: AppFontStyle.bahijSansArabic(
                            fontSize: SizeConfig.titleFontSize,
                            fontColor: AppColors.whiteColor)),
                    SizedBox(height: SizeConfig.extraPadding),
                    CustomListTile(
                      title: AppText(
                          label: AppLocalizations.of(context).shopping,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor)),
                      leading: Icon(
                        Icons.shopping_basket_outlined,
                        color: AppColors.WHITH_COLOR,
                      ),
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeView()));
                      },
                    ),
                    CustomListTile(
                      leading: Icon(
                        Icons.public_rounded,
                        color: AppColors.WHITH_COLOR,
                      ),
                      title: AppText(
                          label: AppLocalizations.of(context).buyWithCash,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor)),
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BuyWithCashView()));
                      },
                    ),
                    CustomListTile(
                      leading: Icon(
                        Icons.note_outlined,
                        color: AppColors.WHITH_COLOR,
                      ),
                      title: AppText(
                          label: AppLocalizations.of(context).processes,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor)),
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TransactionView()));
                      },
                    ),
                    CustomListTile(
                      leading: Icon(
                        Icons.money,
                        color: AppColors.WHITH_COLOR,
                      ),
                      title: AppText(
                          label: AppLocalizations.of(context).commissions,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor)),
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CommissionView()));
                      },
                    ),
                    // CustomListTile(
                    //   leading: Icon(
                    //     Icons.camera_alt_outlined,
                    //     color: AppColors.WHITH_COLOR,
                    //   ),
                    //   title: AppText(
                    //       label: AppLocalizations.of(context).connectivity,
                    //       style: AppFontStyle.bahijSansArabic(
                    //           fontSize: SizeConfig.titleFontSize,
                    //           fontColor: AppColors.whiteColor)),
                    //   press: () {},
                    // ),
                    CustomListTile(
                      leading: Icon(
                        Icons.settings_cell_outlined,
                        color: AppColors.WHITH_COLOR,
                      ),
                      title: AppText(
                          label: AppLocalizations.of(context).contactUs,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor)),
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FirstContactUsView()));
                      },
                    ),
                  ]),
            ),
          ),
          Expanded(child: AppText(label: '')),
        ],
      ),
    );
  }

  @override
  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }
}