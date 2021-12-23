import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_dropdown.dart';
import 'package:rasid_jack/common/widgets/app_image.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/common/widgets/app_text_form_field_item.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/utilities.dart';
import 'package:rasid_jack/views/commissions/bloc.dart/commission_bloc.dart';
import 'package:rasid_jack/views/commissions/view/commission_dialog.dart';
import 'package:rasid_jack/views/commissions/view/popup_content.dart';

// import 'package:rasid_jack/common/widgets/custom_drawer.dart';
import 'package:rxdart/subjects.dart';

class CommissionView extends BaseStatefulWidget {
  @override
  _CommissionViewState createState() => _CommissionViewState();
}

class _CommissionViewState extends BaseState<CommissionView> {
  CommissionBloc bloc = CommissionBloc(names: [
    {"item": "Thomas"},
    {"item": "John"},
    {"item": "Mary"}
  ]);

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                  label: AppLocalizations.of(context).commissions,
                  style: AppFontStyle.bahijSansArabic(
                      fontSize: SizeConfig.titleFontSize,
                      fontColor: AppColors.whiteColor)),
              SizedBox(width: SizeConfig.padding),
              AppImage(path: AppAssets.comissionImage)
            ],
          ),
          Container(
              padding: EdgeInsets.all(SizeConfig.padding),
              decoration: BoxDecoration(
                  color: AppColors.PINK_COLOR, shape: BoxShape.circle),
              child: Container(
                padding: EdgeInsets.all(SizeConfig.padding * 4),
                decoration: BoxDecoration(
                    color: AppColors.DARK_GRAY_COLOR, shape: BoxShape.circle),
                child: Column(
                  children: [
                    AppText(
                        label: '100',
                        style: AppFontStyle.bahijSansArabic(
                            fontSize: SizeConfig.titleFontSize,
                            fontColor: AppColors.whiteColor)),
                    AppText(
                        label: AppLocalizations.of(context).coinRial,
                        style: AppFontStyle.bahijSansArabic(
                            fontSize: SizeConfig.titleFontSize,
                            fontColor: AppColors.whiteColor)),
                  ],
                ),
              )),
        ],
      ),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
              width: double.infinity,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              title: AppLocalizations.of(context).withdrawingCommissions,
              borderColor: AppColors.WHITH_COLOR,
              backgroundColor: AppColors.BUTTON_COLOR,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CommissionDialog(
                        title: '',
                        errorMessage: '',
                        okButtonTitle: '',
                        cancelButtonTitle: AppLocalizations.of(context).back,
                        content: PopUpContent(
                          bloc: bloc,
                        ),
                      )))),
          SizedBox(height: SizeConfig.padding),
          AppButton(
              width: double.infinity,
              title: AppLocalizations.of(context).back,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.titleFontSize,
                  fontColor: AppColors.whiteColor),
              borderColor: AppColors.PINK_COLOR,
              backgroundColor: AppColors.PINK_COLOR,
              onTap: () => Navigator.pop(context))
        ],
      ),
    );
  }
}
