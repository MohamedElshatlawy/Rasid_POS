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
import 'package:rasid_jack/views/home/bloc/home_bloc.dart';

class HomeView extends BaseStatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  HomeBloc bloc = HomeBloc(payNumber: '0');
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
          child: CustomGridView(
            childrenList: [
              AppButton(
                  title: '1',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('1', context)),
              AppButton(
                  title: '2',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('2', context)),
              AppButton(
                  title: '3',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('3', context)),
              AppButton(
                  title: '4',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('4', context)),
              AppButton(
                  title: '5',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('5', context)),
              AppButton(
                  title: '6',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('6', context)),
              AppButton(
                  title: '7',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('7', context)),
              AppButton(
                  title: '8',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('8', context)),
              AppButton(
                  title: '9',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('9', context)),
              AppButton(
                  title: '0',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('0', context)),
              AppButton(
                  title: '00',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('00', context)),
              AppButton(
                  title: '000',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.DARK_GRAY_COLOR,
                  backgroundColor: AppColors.DARK_GRAY_COLOR,
                  onTap: () => bloc.buttonPressed('000', context)),
              AppButton(
                  title: 'دفع',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.GREEN_COLOR,
                  backgroundColor: AppColors.GREEN_COLOR,
                  onTap: () => bloc.buttonPressed('دفع', context)),
              AppButton(
                  title: 'مسح',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.YELLOW_COLOR,
                  backgroundColor: AppColors.YELLOW_COLOR,
                  onTap: () => bloc.buttonPressed('مسح', context)),
              AppButton(
                  title: 'الغاء',
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor),
                  borderColor: AppColors.RED_COLOR,
                  backgroundColor: AppColors.RED_COLOR,
                  onTap: () => bloc.buttonPressed('الغاء', context)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }

  @override
  Widget? getBottomNavigationBar() {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.padding),
      child: AppButton(
          width: double.infinity,
          title: AppLocalizations.of(context).back,
          style: AppFontStyle.bahijSansArabic(
              fontSize: SizeConfig.titleFontSize,
              fontColor: AppColors.whiteColor),
          borderColor: AppColors.PINK_COLOR,
          backgroundColor: AppColors.PINK_COLOR,
          onTap: () => Navigator.pop(context)),
    );
  }
}
