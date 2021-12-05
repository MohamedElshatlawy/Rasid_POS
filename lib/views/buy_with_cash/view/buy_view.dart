import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/custom_gridView.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/buy_with_cash/bloc/buy_with_cash_bloc.dart';
import 'package:rasid_jack/common/widgets/custom_drawer.dart';

class BuyWithCashView extends BaseStatefulWidget {
  @override
  _BuyWithCashViewState createState() => _BuyWithCashViewState();
}

class _BuyWithCashViewState extends BaseState<BuyWithCashView> {
  BuyWithCashBloc bloc = BuyWithCashBloc(payNumber: '0');

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.BUTTON_COLOR,
          padding: EdgeInsets.all(15),
          child: AppText(
              textAlign: TextAlign.center,
              label: AppLocalizations.of(context).deviceId + '6778888654',
              style: AppFontStyle.bahijLight(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.whiteColor)),
        ),
        CustomGridView(
          childrenList: [
            AppButton(
                title: '1',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('1', context)),
            AppButton(
                title: '2',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('2', context)),
            AppButton(
                title: '3',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('3', context)),
            AppButton(
                title: '4',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('4', context)),
            AppButton(
                title: '5',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('5', context)),
            AppButton(
                title: '6',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('6', context)),
            AppButton(
                title: '7',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('7', context)),
            AppButton(
                title: '8',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('8', context)),
            AppButton(
                title: '9',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('9', context)),
            AppButton(
                title: '0',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('0', context)),
            AppButton(
                title: '00',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('00', context)),
            AppButton(
                title: '000',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.DARK_GRAY_COLOR,
                backgroundColor: AppColors.DARK_GRAY_COLOR,
                onTap: () => bloc.buttonPressed('000', context)),
            AppButton(
                title: 'دفع',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.GREEN_COLOR,
                backgroundColor: AppColors.GREEN_COLOR,
                onTap: () => bloc.buttonPressed('دفع', context)),
            AppButton(
                title: 'مسح',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.YELLOW_COLOR,
                backgroundColor: AppColors.YELLOW_COLOR,
                onTap: () => bloc.buttonPressed('مسح', context)),
            AppButton(
                title: 'الغاء',
                style: AppFontStyle.bahijLight(
                    fontSize: SizeConfig.titleFontSize,
                    fontColor: AppColors.whiteColor),
                borderColor: AppColors.RED_COLOR,
                backgroundColor: AppColors.RED_COLOR,
                onTap: () => bloc.buttonPressed('الغاء', context)),
          ],
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget getAppbar() {
    return AppBar(
      flexibleSpace:
          AppImage(path: AppAssets.loginBackground, boxFit: BoxFit.fill),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      bottom: PreferredSize(
          child: Column(
            children: [
              AppText(
                  label: AppLocalizations.of(context).enterNum,
                  style: AppFontStyle.bahijLight(
                      fontSize: SizeConfig.textFontSize,
                      fontColor: AppColors.whiteColor)),
              StreamBuilder(
                  stream: bloc.counterObservable,
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    return AppText(
                        label:
                            "${snapshot.data}.0${AppLocalizations.of(context).coinRial}",
                        style: AppFontStyle.bahijLight(
                            fontSize: SizeConfig.textFontSize,
                            fontColor: AppColors.whiteColor));
                  }),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          AppAssets.loginBackground,
                        ),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    AppText(
                        label: AppLocalizations.of(context).cashAmount,
                        style: AppFontStyle.bahijLight(
                            fontSize: SizeConfig.textFontSize,
                            fontColor: AppColors.whiteColor)),
                    AppText(
                        label: '0.00 ${AppLocalizations.of(context).coinRial}',
                        style: AppFontStyle.bahijLight(
                            fontSize: SizeConfig.textFontSize,
                            fontColor: AppColors.whiteColor))
                  ],
                ),
              ),
            ],
          ),
          preferredSize: Size.fromHeight(SizeConfig.padding * 4)),
    );
  }

  @override
  Widget getDrawer() {
    return CustomDrawer();
  }

  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }
}
