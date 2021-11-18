import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/views/widget/custom_button.dart';
import 'package:rasid_jack/views/widget/custom_input.dart';
import 'package:rasid_jack/views/widget/custom_listtile.dart';
import 'package:rasid_jack/views/widget/custom_text.dart';

class PurchaseView extends BaseStatefulWidget {
  @override
  _PurchaseViewState createState() => _PurchaseViewState();
}

class _PurchaseViewState extends BaseState<PurchaseView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.BLACK_COLOR,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInput(
              hintText: 'بحث',
              underLineBorder: true,
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _rowWidget('يناير 2020'),
                Icon(Icons.remove, color: AppColors.WHITH_COLOR),
                _rowWidget('فبراير 2020'),
              ],
            ),
            _listViewWidget('38884884', '300ريال', 'مقبوله', 'فيزا', '54322',
                '43334444444', '444453333')
          ],
        ),
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
      title: CustomText(text: 'العمليات', fontSize: 30.sp),
      centerTitle: true,
      leading: IconButton(
          onPressed: () => showAppDialog(
              title: '',
              errorMessage: '',
              okButtonTitle: '',
              cancelButtonTitle: 'رجوع'),
          icon: Icon(
            Icons.menu,
            color: AppColors.WHITH_COLOR,
          )),
    );
  }

  Widget _rowWidget(String text) {
    return Row(
      children: [
        Icon(Icons.calendar_today_outlined, color: AppColors.PINK_COLOR),
        SizedBox(width: 10.w),
        CustomText(text: text)
      ],
    );
  }

  Widget _listViewWidget(
      String numberOfPurchase,
      valueOfPurchase,
      opeationStatus,
      paymentMethod,
      lastFourNumber,
      approvalnumber,
      operationNumber) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'رقم العملية'),
                  CustomText(text: numberOfPurchase),
                  _listTileWidget(
                    'قيمة العملية',
                    valueOfPurchase,
                  ),
                  _listTileWidget(
                    'حاله العملية',
                    opeationStatus,
                  ),
                  _listTileWidget(
                    'طريقه الدفع',
                    paymentMethod,
                  ),
                  _listTileWidget(
                    'اخر اربع ارقام من البطاقه',
                    lastFourNumber,
                  ),
                  _listTileWidget(
                    'رقم الموافقه',
                    approvalnumber,
                  ),
                  _listTileWidget(
                    'رقم العملية',
                    operationNumber,
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _listTileWidget(String title, tralling) {
    return Container(
      height: 40.h,
      child: CustomListTile(
        title: CustomText(text: title),
        padding: EdgeInsets.zero,
        trailing: CustomText(text: tralling),
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
            content: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.DARK_GRAY_COLOR),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(text: 'استرداد', fontSize: 30.sp),
                  Divider(color: AppColors.GRAY_COLOR),
                  CustomText(text: 'ايصال', fontSize: 30.sp),
                  Divider(color: AppColors.GRAY_COLOR),
                ],
              ),
            )));
  }
}
