import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/common/widgets/custom_gridView.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/views/pay/view/pay_view.dart';
import 'package:rasid_jack/common/widgets/custom_button.dart';
import 'package:rasid_jack/common/widgets/custom_drawer.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

class HomeView extends BaseStatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  String payNumber = '0';

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: AppColors.BUTTON_COLOR,
            child: CustomButton(
              buttonText: 'رقم تعريف الجهاز 33239949929293499',
            ),
          ),
          CustomGridView(
            childrenList: [
              CustomButton(
                  buttonText: '1',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('1'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '2',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('2'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '3',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('3'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '4',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('4'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '5',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('5'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '6',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('6'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '7',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('7'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '8',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('8'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '9',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('9'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '0',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('0'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '00',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('00'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: '000',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('000'),
                  buttonColor: AppColors.DARK_GRAY_COLOR),
              CustomButton(
                  buttonText: 'دفع',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('دفع'),
                  buttonColor: AppColors.GREEN_COLOR),
              CustomButton(
                  buttonText: 'مسح',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('مسح'),
                  buttonColor: AppColors.YELLOW_COLOR),
              CustomButton(
                  buttonText: 'الغاء',
                  fontSize: SizeConfig.titleFontSize,
                  press: () => buttonPressed('الغاء'),
                  buttonColor: AppColors.RED_COLOR),
            ],
          ),
        ],
      ),
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
      title:
          CustomText(text: 'ادخل المبلغ', fontSize: SizeConfig.titleFontSize),
      bottom: PreferredSize(
          child: CustomText(
              text: "${payNumber}.0ريال", fontSize: SizeConfig.titleFontSize),
          preferredSize: Size.fromHeight(SizeConfig.btnHeight)),
      centerTitle: true,
    );
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'الغاء') {
        payNumber = "0";
      } else if (buttonText == 'مسح') {
        payNumber = payNumber.substring(0, payNumber.length - 1);
        if (payNumber == "") {
          payNumber = "0";
        }
      } else if (buttonText == 'دفع') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PayView()));
      } else {
        if (payNumber == "0") {
          payNumber = buttonText;
        } else {
          payNumber = payNumber + buttonText;
        }
      }
    });
  }

  @override
  Widget getDrawer() {
    return CustomDrawer();
  }

  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }
}
