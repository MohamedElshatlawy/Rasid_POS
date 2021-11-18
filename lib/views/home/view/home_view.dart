import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/pay/view/pay_view.dart';

import 'package:rasid_jack/views/widget/custom_button.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';

class HomeView extends BaseStatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  double payNumber = 0.0;

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.BLACK_COLOR,
      child: Column(
        children: [
          Container(
            color: AppColors.BUTTON_COLOR,
            child: CustomButton(
              buttonText: 'رقم تعريف الجهاز 33239949929293499',
            ),
          ),
          _gridViewWidget(
            List.generate(
                9,
                (index) => CustomButton(
                      press: () {
                        setState(() {
                          payNumber = index + 1;
                        });
                      },
                      fontSize: 30.sp,
                      buttonText: (index + 1).toString(),
                      buttonColor: AppColors.DARK_GRAY_COLOR,
                    )),
          ),
          _gridViewWidget([
            CustomButton(
                buttonText: '0',
                press: () => setState(() {}),
                buttonColor: AppColors.DARK_GRAY_COLOR,
                fontSize: 30.sp),
            CustomButton(
                buttonText: '00',
                press: () => setState(() {}),
                buttonColor: AppColors.DARK_GRAY_COLOR,
                fontSize: 30.sp),
            CustomButton(
                buttonText: '000',
                press: () => setState(() {}),
                buttonColor: AppColors.DARK_GRAY_COLOR,
                fontSize: 30.sp),
          ]),
          _gridViewWidget([
            CustomButton(
                buttonText: 'دفع',
                press: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => PayView())),
                buttonColor: AppColors.GREEN_COLOR,
                fontSize: 25.sp),
            CustomButton(
                buttonText: 'مسح',
                buttonColor: AppColors.YELLOW_COLOR,
                fontSize: 25.sp),
            CustomButton(
                buttonText: 'الغاء',
                buttonColor: AppColors.RED_COLOR,
                fontSize: 25.sp),
          ]),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget getAppbar() {
    return AppBar(
      flexibleSpace: Image(
        image: AssetImage(
          "assets/images/Rectangle.png",
        ),
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: CustomText(text: 'ادخل المبلغ', fontSize: 30.sp),
      bottom: PreferredSize(
          child: CustomText(text: "${payNumber}ريال", fontSize: 30.sp),
          preferredSize: Size.fromHeight(70.h)),
      centerTitle: true,
      leading: IconButton(
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
          icon: Icon(
            Icons.menu,
            color: AppColors.WHITH_COLOR,
          )),
    );
  }

  Widget _gridViewWidget(List<Widget> childrenList) {
    return GridView.count(
        padding: EdgeInsets.all(10),
        crossAxisCount: 3,
        shrinkWrap: true,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 20.h,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 2.h,
        children: childrenList);
  }
}
