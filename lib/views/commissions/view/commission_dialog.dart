import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/base/dialog/data_models/alert_request.dart';
import 'package:rasid_jack/base/dialog/data_models/alert_response.dart';
import 'package:rasid_jack/base/dialog/services/dialog_service.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/size_config.dart';


class CommissionDialog extends StatefulWidget {
  String title;
  String errorMessage;
  String okButtonTitle;
  String? cancelButtonTitle;
  Widget? content;

  CommissionDialog(
      {required this.title, required this.errorMessage, required this.okButtonTitle, this.cancelButtonTitle, this.content});

  _CommissionDialogState createState() => _CommissionDialogState();
}

class _CommissionDialogState extends State<CommissionDialog> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   backgroundColor: AppColors.transparentColor.withOpacity(.8),
      body: AlertDialog(
        backgroundColor: AppColors.transparentColor,insetPadding: EdgeInsets.zero,
        actions: [
          AppButton(
            width: double.infinity,
            style: AppFontStyle.bahijSansArabic(
                fontSize: SizeConfig.textFontSize,
                fontColor: AppColors.whiteColor),
            title: widget.cancelButtonTitle.toString(),
            borderColor: AppColors.PINK_COLOR,
            backgroundColor: AppColors.PINK_COLOR,
            onTap: () => Navigator.pop(context),
          )
        ],
        content: widget.content ?? SizedBox(),
      ),
    );
  }


}