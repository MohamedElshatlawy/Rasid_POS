import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/widget/custom_button.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';

class BuyWithCashView extends BaseStatefulWidget {
  @override
  _BuyWithCashViewState createState() => _BuyWithCashViewState();
}

class _BuyWithCashViewState extends BaseState<BuyWithCashView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.BLACK_COLOR,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            Container(
              height: 630.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Capture.PNG'),
                      fit: BoxFit.fill)),
            )
          ],
        ));
  }

  @override
  PreferredSizeWidget getAppbar() {
    return AppBar(
      actions: [iconContainer(Icon(Icons.close), () => Navigator.pop(context))],
      leading: CustomText(text: ''),
      backgroundColor: AppColors.BLACK_COLOR,
      elevation: 0.0,
    );
  }

  Widget iconContainer(Widget icon, Function() press) {
    return Container(
      child: IconButton(
        icon: icon,
        color: AppColors.BLACK_COLOR,
        iconSize: 30.sp,
        onPressed: press,
      ),
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: AppColors.WHITH_COLOR,
          borderRadius: BorderRadius.circular(10.r)),
    );
  }

  @override
  Widget? getFloatingActionButton() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: IconButton(
          onPressed: () => showAppDialog(
              title: '',
              errorMessage: '',
              okButtonTitle: '',
              cancelButtonTitle: 'رجوع'),
          icon: Icon(
            Icons.share,
            size: 100.sp,
            color: AppColors.PINK_COLOR,
          )),
    );
  }

  @override
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
              CustomButton(
                buttonText: cancelButtonTitle.toString(),
                buttonColor: AppColors.PINK_COLOR,
                press: () => Navigator.pop(context),
              )
            ],
            content: Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.DARK_GRAY_COLOR),
              child: Image.asset('assets/images/Bitmap.png'),
            )));
  }
}
