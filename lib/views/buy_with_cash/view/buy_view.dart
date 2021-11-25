import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/custom_gridView.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/buy_with_cash/bloc/buy_with_cash_bloc.dart';
import 'package:rasid_jack/views/pay/view/pay_view.dart';
import 'package:rasid_jack/common/widgets/custom_button.dart';
import 'package:rasid_jack/common/widgets/custom_drawer.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

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
          color: AppColors.BUTTON_COLOR,
          child: CustomButton(
            buttonText: AppLocalizations.of(context).deviceId + '6778888654',
          ),
        ),
        CustomGridView(
          childrenList: [
            CustomButton(
                buttonText: '1',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('1', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '2',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('2', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '3',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('3', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '4',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('4', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '5',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('5', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '6',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('6', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '7',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('7', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '8',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('8', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '9',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('9', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '0',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('0', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '00',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('00', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: '000',
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('000', context),
                buttonColor: AppColors.DARK_GRAY_COLOR),
            CustomButton(
                buttonText: AppLocalizations.of(context).pay,
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('دفع', context),
                buttonColor: AppColors.GREEN_COLOR),
            CustomButton(
                buttonText: AppLocalizations.of(context).delete,
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('مسح', context),
                buttonColor: AppColors.YELLOW_COLOR),
            CustomButton(
                buttonText: AppLocalizations.of(context).cancel,
                fontSize: SizeConfig.titleFontSize,
                press: () => bloc.buttonPressed('الغاء', context),
                buttonColor: AppColors.RED_COLOR),
          ],
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget getAppbar() {
    return AppBar(
      flexibleSpace: Image(
        image: AssetImage(
          AppAssets.loginBackground,
        ),
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      bottom: PreferredSize(
          child: Column(
            children: [
              CustomText(
                  text: AppLocalizations.of(context).enterNum,
                  fontSize: SizeConfig.titleFontSize),
              StreamBuilder(
                  stream: bloc.counterObservable,
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    return CustomText(
                        text:
                            "${snapshot.data}.0${AppLocalizations.of(context).coinRial}",
                        fontSize: SizeConfig.titleFontSize);
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
                    CustomText(
                        text: AppLocalizations.of(context).cashAmount,
                        fontSize: SizeConfig.titleFontSize),
                    CustomText(
                        text: '0.00 ${AppLocalizations.of(context).coinRial}',
                        fontSize: SizeConfig.titleFontSize)
                  ],
                ),
              ),
            ],
          ),
          preferredSize: Size.fromHeight(SizeConfig.padding * 5)),
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
