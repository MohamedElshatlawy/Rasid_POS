import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/custom_popUp.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/common/widgets/custom_button.dart';
import 'package:rasid_jack/common/widgets/custom_drawer.dart';
import 'package:rasid_jack/common/widgets/custom_input.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

class CommissionView extends BaseStatefulWidget {
  @override
  _CommissionViewState createState() => _CommissionViewState();
}

class _CommissionViewState extends BaseState<CommissionView> {
  String value = 'اسم البنك';

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(text: 'العمولات', fontSize: SizeConfig.titleFontSize),
              SizedBox(width: SizeConfig.padding),
              Image.asset(AppAssets.comissionImage)
            ],
          ),
          SizedBox(height: SizeConfig.extraPadding),
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
                    CustomText(text: '100', fontSize: SizeConfig.titleFontSize),
                    CustomText(
                        text: 'ريال', fontSize: SizeConfig.titleFontSize),
                  ],
                ),
              )),
          SizedBox(height: SizeConfig.extraPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding),
            child: CustomButton(
              buttonText: 'سحب العمولات',
              borderColor: AppColors.WHITH_COLOR,
              press: () => showAppDialog(
                title: '',
                errorMessage: '',
                okButtonTitle: '',
                cancelButtonTitle: 'رحوع',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget getAppbar() {
    return AppBar(
      actions: [buildBackButton()],
      backgroundColor: AppColors.BLACK_COLOR,
      elevation: 0.0,
    );
  }

  @override
  Future<void> showAppDialog(
      {required String title,
      required String errorMessage,
      required String okButtonTitle,
      String? cancelButtonTitle,
      Widget? content}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => SingleChildScrollView(
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                actions: [
                  CustomButton(
                    buttonText: cancelButtonTitle.toString(),
                    buttonColor: AppColors.PINK_COLOR,
                    press: () => Navigator.pop(context),
                  )
                ],
                content: content!,
              ),
            ));
  }

  @override
  Widget getDrawer() {
    return CustomDrawer();
  }

  @override
  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }

  @override
  Widget buildBackButton() {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Image(
        image: AssetImage(AppAssets.BACK_BTN),
      ),
    );
  }
}
