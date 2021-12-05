import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/utilities.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app_button.dart';
import 'app_text.dart';

class AppWebView extends BaseStatefulWidget {
  final String title;
  final String url;

  AppWebView({Key? key, required this.title, required this.url});

  @override
  _AppWebViewState createState() => _AppWebViewState();
}

class _AppWebViewState extends BaseState<AppWebView> {
  @override
  Widget getBody(BuildContext context) {
    return  WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (url) {
      },
    );
  }

  @override
  PreferredSizeWidget? getAppbar() {
    // TODO: implement getAppbar
    return AppBar(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding / 2),
        child: AppText(
          label: widget.title,
          style: AppFontStyle.bahijSemiBold(
              fontSize: SizeConfig.titleFontSize,
              fontColor: AppColors.whiteColor),
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.blackBGColor,
      elevation: 0.0,
    );
  }

  @override
  Future<bool> onWillPop() {
    // TODO: implement onWillPop
    return Utilities.popWidget(context);
  }

  @override
  Color getScaffoldBackgroundColor() {
    // TODO: implement getScaffoldBackgroundColor
    return AppColors.blackBGColor;
  }
  @override
  Widget? getBottomNavigationBar() {
    // TODO: implement getBottomNavigationBar
    return Container(
      padding: EdgeInsets.only(
          left: SizeConfig.padding,
          top: SizeConfig.padding,
          right: SizeConfig.padding,
          bottom: SizeConfig.padding),
      child: AppButton(
          title: AppLocalizations.of(context).back,
          style: AppFontStyle.bahijLight(
              fontSize: SizeConfig.textFontSize,
              fontColor: AppColors.whiteColor),
          borderColor: AppColors.accentColor,
          backgroundColor: AppColors.accentColor,
          width: SizeConfig.blockSizeHorizontal * 100,
          onTap: onWillPop),
    );
  }

}
