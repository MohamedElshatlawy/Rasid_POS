import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/common/widgets/custom_button.dart';
import 'package:rasid_jack/common/widgets/custom_drawer.dart';
import 'package:rasid_jack/common/widgets/custom_input.dart';
import 'package:rasid_jack/common/widgets/custom_listtile.dart';
import 'package:rasid_jack/common/widgets/custom_text.dart';

class PurchaseView extends BaseStatefulWidget {
  @override
  _PurchaseViewState createState() => _PurchaseViewState();
}

class _PurchaseViewState extends BaseState<PurchaseView> {
  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomInput(
            hintText: 'بحث',
            underLineBorder: true,
          ),
          SizedBox(height: SizeConfig.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      color: AppColors.PINK_COLOR),
                  SizedBox(width: SizeConfig.padding),
                  CustomText(text: 'يناير 2020')
                ],
              ),
              Icon(Icons.remove, color: AppColors.WHITH_COLOR),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      color: AppColors.PINK_COLOR),
                  SizedBox(width: SizeConfig.padding),
                  CustomText(text: 'فبراير 2020')
                ],
              ),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(SizeConfig.padding),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.padding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'رقم العملية'),
                      CustomText(text: '38884884'),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: CustomText(text: 'قيمة العملية'),
                          padding: EdgeInsets.zero,
                          trailing: CustomText(text: '38884884'),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: CustomText(text: 'حاله العملية'),
                          padding: EdgeInsets.zero,
                          trailing: CustomText(text: 'فيزا'),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: CustomText(text: 'طريقه الدفع'),
                          padding: EdgeInsets.zero,
                          trailing: CustomText(text: 'مقبوله'),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: CustomText(text: 'اخر اربع ارقام من البطاقه'),
                          padding: EdgeInsets.zero,
                          trailing: CustomText(text: '45643'),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: CustomText(text: 'رقم الموافقه'),
                          padding: EdgeInsets.zero,
                          trailing: CustomText(text: '38884884'),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: CustomListTile(
                          title: CustomText(text: 'رقم العملية'),
                          padding: EdgeInsets.zero,
                          trailing: CustomText(text: '38884884'),
                        ),
                      ),
                    ],
                  ),
                );
              }),
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
      title: CustomText(text: 'العمليات', fontSize: SizeConfig.titleFontSize),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () => showAppDialog(
                title: '',
                errorMessage: '',
                okButtonTitle: '',
                cancelButtonTitle: 'رجوع'),
            icon: CustomText(text: 'Pop'))
      ],
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
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.padding, vertical: SizeConfig.padding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.borderRaduis),
                  color: AppColors.DARK_GRAY_COLOR),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(text: 'استرداد', fontSize: 30),
                  Divider(color: AppColors.GRAY_COLOR),
                  CustomText(text: 'ايصال', fontSize: 30),
                  Divider(color: AppColors.GRAY_COLOR),
                ],
              ),
            )));
  }

  @override
  Widget getDrawer() {
    return CustomDrawer();
  }

  Color getScaffoldBackgroundColor() {
    return AppColors.BLACK_COLOR;
  }
}
