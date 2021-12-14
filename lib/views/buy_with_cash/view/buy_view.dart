import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/custom_gridView.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/buy_with_cash/bloc/buy_with_cash_bloc.dart';

class BuyWithCashView extends BaseStatefulWidget {
  @override
  _BuyWithCashViewState createState() => _BuyWithCashViewState();
}

class _BuyWithCashViewState extends BaseState<BuyWithCashView> {
  BuyWithCashBloc bloc = BuyWithCashBloc(payNumber: '0', cashNumber: '0');

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              top: SizeConfig.padding * 4, bottom: SizeConfig.padding),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.loginBackground,
                  ),
                  fit: BoxFit.fill)),
          child: InkWell(
            onTap: () => bloc.chooseInput(true),
            child: Column(
              children: [
                AppText(
                    label: AppLocalizations.of(context).enterNum,
                    style: AppFontStyle.bahijSansArabic(
                        fontSize: SizeConfig.titleFontSize,
                        fontColor: AppColors.whiteColor)),
                StreamBuilder(
                    stream: bloc.counterObservable,
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      return AppText(
                          label:
                              "${snapshot.data}.0${AppLocalizations.of(context).coinRial}",
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor));
                    }),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(SizeConfig.padding),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.loginBackground,
                  ),
                  fit: BoxFit.fill)),
          child: InkWell(
            onTap: () => bloc.chooseInput(false),
            child: Column(
              children: [
                AppText(
                    label: AppLocalizations.of(context).cashAmount,
                    style: AppFontStyle.bahijSansArabic(
                        fontSize: SizeConfig.titleFontSize,
                        fontColor: AppColors.whiteColor)),
                StreamBuilder(
                    stream: bloc.cashObservable,
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      return AppText(
                          label:
                              "${snapshot.data}.0${AppLocalizations.of(context).coinRial}",
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor));
                    }),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: AppColors.BUTTON_COLOR,
          padding: EdgeInsets.all(15),
          child: AppText(
              textAlign: TextAlign.center,
              label: AppLocalizations.of(context).deviceId + '6778888654',
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.whiteColor)),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.padding, vertical: SizeConfig.padding),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                          width: SizeConfig.padding * 7,
                          height: double.infinity,
                          radius: 2,
                          title: '1',
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('1', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          width: SizeConfig.padding * 7,
                          height: double.infinity,
                          title: '2',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('2', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: '3',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('3', context)),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.padding * 0.3),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: '4',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('4', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: '5',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('5', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: '6',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('6', context)),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.padding * 0.3),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: '7',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('7', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: '8',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('8', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: '9',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('9', context)),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.padding * 0.3),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                          width: SizeConfig.padding * 7,
                          height: double.infinity,
                          title: '0',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('0', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          width: SizeConfig.padding * 7,
                          height: double.infinity,
                          title: '00',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('00', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: '000',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.DARK_GRAY_COLOR,
                          backgroundColor: AppColors.DARK_GRAY_COLOR,
                          onTap: () => bloc.buttonPressed('000', context)),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.padding * 0.3),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                          width: SizeConfig.padding * 7,
                          height: double.infinity,
                          title: 'دفع',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.GREEN_COLOR,
                          backgroundColor: AppColors.GREEN_COLOR,
                          onTap: () => bloc.buttonPressed('دفع', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          width: SizeConfig.padding * 7,
                          height: double.infinity,
                          title: 'مسح',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.YELLOW_COLOR,
                          backgroundColor: AppColors.YELLOW_COLOR,
                          onTap: () => bloc.buttonPressed('مسح', context)),
                      SizedBox(width: SizeConfig.padding * 0.3),
                      AppButton(
                          height: double.infinity,
                          width: SizeConfig.padding * 7,
                          title: 'الغاء',
                          radius: 2,
                          style: AppFontStyle.bahijSansArabic(
                              fontSize: SizeConfig.titleFontSize,
                              fontColor: AppColors.whiteColor),
                          borderColor: AppColors.RED_COLOR,
                          backgroundColor: AppColors.RED_COLOR,
                          onTap: () => bloc.buttonPressed('الغاء', context)),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.padding * 0.5),
                AppButton(
                    width: double.infinity,
                    title: AppLocalizations.of(context).back,
                    style: AppFontStyle.bahijSansArabic(
                        fontSize: SizeConfig.titleFontSize,
                        fontColor: AppColors.whiteColor),
                    borderColor: AppColors.PINK_COLOR,
                    backgroundColor: AppColors.PINK_COLOR,
                    onTap: () => Navigator.pop(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }

  // @override
  // Widget? getBottomNavigationBar() {
  //   return Padding(
  //     padding: EdgeInsets.all(SizeConfig.padding),
  //     child: AppButton(
  //         width: double.infinity,
  //         title: AppLocalizations.of(context).back,
  //         style: AppFontStyle.bahijSansArabic(
  //             fontSize: SizeConfig.titleFontSize,
  //             fontColor: AppColors.whiteColor),
  //         borderColor: AppColors.PINK_COLOR,
  //         backgroundColor: AppColors.PINK_COLOR,
  //         onTap: () => Navigator.pop(context)),
  //   );
  // }
}
