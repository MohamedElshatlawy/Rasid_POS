import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_divider.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_label_with_icon.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/common/widgets/custom_drawer.dart';
import 'package:rasid_jack/common/widgets/custom_input.dart';
import 'package:rasid_jack/common/widgets/custom_listtile.dart';

class PurchaseView extends BaseStatefulWidget {
  @override
  _PurchaseViewState createState() => _PurchaseViewState();
}

class _PurchaseViewState extends BaseState<PurchaseView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomInput(
            hintText: AppLocalizations.of(context).search,
            underLineBorder: true,
          ),
          SizedBox(height: SizeConfig.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppLabelWithIcon(
                  label: 'يناير 2020',
                  labelColor: AppColors.whiteColor,
                  icon: Icon(Icons.calendar_today_outlined,
                      color: AppColors.PINK_COLOR)),
              Icon(Icons.remove, color: AppColors.WHITH_COLOR),
              AppLabelWithIcon(
                  label: 'فبراير 2020',
                  labelColor: AppColors.whiteColor,
                  icon: Icon(Icons.calendar_today_outlined,
                      color: AppColors.PINK_COLOR)),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(SizeConfig.padding),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.padding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          label: AppLocalizations.of(context).operationNum,
                          style: AppFontStyle.bahijLight(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      AppText(
                          label: '38884884',
                          style: AppFontStyle.bahijLight(
                              fontSize: SizeConfig.textFontSize,
                              fontColor: AppColors.whiteColor)),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: AppText(
                              label: AppLocalizations.of(context).operationval,
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          padding: EdgeInsets.zero,
                          trailing: AppText(
                              label: '38884884',
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: AppText(
                              label:
                                  AppLocalizations.of(context).operationStatus,
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          padding: EdgeInsets.zero,
                          trailing: AppText(
                              label: 'فيزا',
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: AppText(
                              label: AppLocalizations.of(context).paymentMethod,
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          padding: EdgeInsets.zero,
                          trailing: AppText(
                              label: 'مقبوله',
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: AppText(
                              label: AppLocalizations.of(context)
                                  .lastfourNumOfCard,
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          padding: EdgeInsets.zero,
                          trailing: AppText(
                              label: '45643',
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: AppText(
                              label:
                                  AppLocalizations.of(context).approvalNumber,
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          padding: EdgeInsets.zero,
                          trailing: AppText(
                              label: '38884884',
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: AppText(
                              label: AppLocalizations.of(context).operationNum,
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                          padding: EdgeInsets.zero,
                          trailing: AppText(
                              label: '38884884',
                              style: AppFontStyle.bahijLight(
                                  fontSize: SizeConfig.textFontSize,
                                  fontColor: AppColors.whiteColor)),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget getAppbar() {
    return AppBar(
      flexibleSpace:
          AppImage(path: AppAssets.loginBackground, boxFit: BoxFit.fill),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: AppText(
          label: AppLocalizations.of(context).processes,
          style: AppFontStyle.bahijLight(
              fontSize: SizeConfig.titleFontSize,
              fontColor: AppColors.whiteColor)),
      centerTitle: true,
      actions: [
        AppButton(
            title: "Pop up",
            style: AppFontStyle.bahijLight(
                fontSize: SizeConfig.textFontSize,
                fontColor: AppColors.whiteColor),
            borderColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            onTap: () => showAppDialog(
                title: '',
                errorMessage: '',
                okButtonTitle: '',
                cancelButtonTitle: AppLocalizations.of(context).back),
            icon: AppText(label: ''))
      ],
    );
  }

  Future<void> showAppDialog(
      {required String title,
      required String errorMessage,
      required String okButtonTitle,
      String? cancelButtonTitle}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.transparent,
            actions: [
              AppButton(
                  width: double.infinity,
                  style: AppFontStyle.bahijLight(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor),
                  title: cancelButtonTitle.toString(),
                  borderColor: AppColors.PINK_COLOR,
                  backgroundColor: AppColors.PINK_COLOR,
                  onTap: () => Navigator.pop(context)),
            ],
            content: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.padding, vertical: SizeConfig.padding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.borderRaduis),
                  color: AppColors.DARK_GRAY_COLOR),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                      label: AppLocalizations.of(context).recovery,
                      style: AppFontStyle.bahijLight(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor)),
                  AppDivider(),
                  AppText(
                      label: AppLocalizations.of(context).receipt,
                      style: AppFontStyle.bahijLight(
                          fontSize: SizeConfig.titleFontSize,
                          fontColor: AppColors.whiteColor)),
                  AppDivider(),
                ],
              ),
            )));
  }

  @override
  Widget getDrawer() {
    return CustomDrawer();
  }

  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }
}
