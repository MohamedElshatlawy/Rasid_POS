// import 'package:flutter/material.dart';
// import 'package:rasid_jack/common/widgets/app_image.dart';
// import 'package:rasid_jack/common/widgets/app_text.dart';
// import 'package:rasid_jack/utilities/constants/app_assets.dart';
// import 'package:rasid_jack/utilities/constants/app_colors.dart';
// import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
// import 'package:rasid_jack/utilities/localization/localizations.dart';
// import 'package:rasid_jack/utilities/size_config.dart';
// import 'package:rasid_jack/views/buy_with_cash/view/buy_view.dart';
// import 'package:rasid_jack/views/commissions/view/commission_view.dart';
// import 'package:rasid_jack/views/contactUs/view/contact_us_view.dart';
// import 'package:rasid_jack/views/home/view/home_view.dart';
// import 'package:rasid_jack/common/widgets/custom_listtile.dart';
// import 'package:rasid_jack/views/transactions/view/transactions_view.dart';

// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage(AppAssets.loginBackground),
//           ),
//         ),
//         child: ListView(children: [
//           DrawerHeader(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 IconButton(
//                   icon: AppImage(path: AppAssets.profileButton),
//                   iconSize: SizeConfig.btnHeight,
//                   onPressed: null,
//                 ),
//                 SizedBox(height: SizeConfig.padding),
//                 AppText(
//                     label: AppLocalizations.of(context).userName,
//                     style: AppFontStyle.bahijBold(
//                         fontSize: SizeConfig.titleFontSize,
//                         fontColor: AppColors.whiteColor)),
//               ],
//             ),
//           ),
//           SizedBox(height: SizeConfig.padding),
//           CustomListTile(
//             trailing: Icon(
//               Icons.shopping_basket_outlined,
//               color: AppColors.WHITH_COLOR,
//             ),
//             title: AppText(
//                 label: AppLocalizations.of(context).shopping,
//                 style: AppFontStyle.bahijLight(
//                     fontSize: SizeConfig.titleFontSize,
//                     fontColor: AppColors.whiteColor)),
//             press: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => HomeView()));
//             },
//           ),
//           CustomListTile(
//             trailing: Icon(
//               Icons.public_rounded,
//               color: AppColors.WHITH_COLOR,
//             ),
//             title: AppText(
//                 label: AppLocalizations.of(context).buyWithCash,
//                 style: AppFontStyle.bahijLight(
//                     fontSize: SizeConfig.titleFontSize,
//                     fontColor: AppColors.whiteColor)),
//             press: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => BuyWithCashView()));
//             },
//           ),
//           CustomListTile(
//             trailing: Icon(
//               Icons.note_outlined,
//               color: AppColors.WHITH_COLOR,
//             ),
//             title: AppText(
//                 label: AppLocalizations.of(context).processes,
//                 style: AppFontStyle.bahijLight(
//                     fontSize: SizeConfig.titleFontSize,
//                     fontColor: AppColors.whiteColor)),
//             // press: () {
//             //   Navigator.of(context).push(
//             //       MaterialPageRoute(builder: (context) => PurchaseView()));
//             // },
//           ),
//           CustomListTile(
//             trailing: Icon(
//               Icons.money,
//               color: AppColors.WHITH_COLOR,
//             ),
//             title: AppText(
//                 label: AppLocalizations.of(context).commissions,
//                 style: AppFontStyle.bahijLight(
//                     fontSize: SizeConfig.titleFontSize,
//                     fontColor: AppColors.whiteColor)),
//             press: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => CommissionView()));
//             },
//           ),
//           CustomListTile(
//             trailing: Icon(
//               Icons.camera_alt_outlined,
//               color: AppColors.WHITH_COLOR,
//             ),
//             title: AppText(
//                 label: AppLocalizations.of(context).connectivity,
//                 style: AppFontStyle.bahijLight(
//                     fontSize: SizeConfig.titleFontSize,
//                     fontColor: AppColors.whiteColor)),
//             press: () {},
//           ),
//           CustomListTile(
//             trailing: Icon(
//               Icons.settings_cell_outlined,
//               color: AppColors.WHITH_COLOR,
//             ),
//             title: AppText(
//                 label: AppLocalizations.of(context).contactUs,
//                 style: AppFontStyle.bahijLight(
//                     fontSize: SizeConfig.titleFontSize,
//                     fontColor: AppColors.whiteColor)),
//             press: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => ContactUsView()));
//             },
//           ),
//         ]),
//       ),
//     );
//   }
// }
