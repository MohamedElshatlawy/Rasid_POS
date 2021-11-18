import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/home/view/home_drawer_view.dart';
import 'package:rasid_jack/views/widget/custom_button.dart';
import 'package:rasid_jack/views/widget/custom_input.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';

class LoginView extends BaseStatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/Rectangle.png'),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Logo.png',
              ),
            ),
            SizedBox(height: 50.h),
            CustomInput(
              labelText: 'رقم السجل / الهوايه',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20.h),
            CustomInput(
              obscureText: true,
              labelText: 'كلمه المرور',
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20.h),
            _pressedTextWidget(
                () {}, 'نسيت كلمه المرور؟', AppColors.WHITH_COLOR),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'تسجيل الدخول',
              buttonColor: AppColors.BUTTON_COLOR,
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeDrawerView())),
            ),
            SizedBox(height: 120.h),
            Align(
                alignment: Alignment.center,
                child: _pressedTextWidget(
                    () {}, "عن التطبيق", AppColors.WHITH_COLOR)),
            SizedBox(height: 20.h),
            Divider(color: AppColors.GRAY_COLOR),
            _rowtWidget('ليس لديك حساب ؟ ', 'سجل الان', () {})
          ],
        ),
      ),
    );
  }

  Widget _pressedTextWidget(Function textTap, String text, Color textColor) {
    return GestureDetector(
        onTap: () => textTap,
        child: CustomText(
          text: text,
          fontSize: 15.sp,
          textColor: textColor,
        ));
  }

  Widget _rowtWidget(String text, textTabed, Function textTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: text),
        _pressedTextWidget(textTap, textTabed, AppColors.PINK_COLOR),
      ],
    );
  }
}
