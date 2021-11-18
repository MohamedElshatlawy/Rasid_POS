import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/widget/custom_button.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';

class PayView extends BaseStatefulWidget {
  @override
  _PayViewState createState() => _PayViewState();
}

class _PayViewState extends BaseState<PayView> {
  bool visable = false;
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.BLACK_COLOR,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pinInput((string) => setState(() {
                  visable = true;
                })),
            _payedImage(),
            _text('20.00 SAR'),
            _text('20.00 ريال'),
            _payButton(() {
              showAppDialog(
                  title: '',
                  errorMessage: '',
                  okButtonTitle: '',
                  cancelButtonTitle: 'رجوع');
            }),
          ],
        ),
      ),
    );
  }

  Widget _pinInput(Function(String) done) {
    return PinCodeTextField(
      maxLength: 4,
      highlightPinBoxColor: AppColors.PINK_COLOR,
      pinBoxHeight: 50.h,
      pinBoxBorderWidth: 0.0,
      pinBoxWidth: 50.w,
      pinBoxRadius: 10.r,
      pinTextStyle: TextStyle(
        fontSize: 20.sp,
      ),
      onDone: done,
    );
  }

  Widget _payedImage() {
    return Image.asset(
      'assets/images/pay.png',
      height: 240.h,
      width: 210.w,
    );
  }

  Widget _text(String text) {
    return CustomText(
      text: text,
      fontSize: 33.sp,
    );
  }

  Widget _payButton(Function() tap) {
    return Visibility(
        visible: visable,
        child: GestureDetector(
          onTap: tap,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: double.infinity,
              height: 114.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: AppColors.DARK_GRAY_COLOR),
              child: Image.asset('assets/images/payButton.png')),
        ));
  }

  Widget _alertContainer(String text, String qrCode) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.DARK_GRAY_COLOR,
      ),
      height: 240.h,
      width: 220.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: text,
            textColor: AppColors.WHITH_COLOR,
          ),
          Image.asset(
            qrCode,
            height: 198.h,
            width: 198.w,
          ),
        ],
      ),
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
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _alertContainer('الايصال', 'assets/images/Bitmap.png'),
                _alertContainer('سجل البيانات', 'assets/images/Bitmap.png'),
              ],
            )));
  }
}
