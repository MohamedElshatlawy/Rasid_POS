import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class AppBottomSheet {
  final BuildContext context;
  final Widget bottomSheetLabel;
  final Widget bottomSheetDescription;
  final Widget bottomSheetButtons;

  AppBottomSheet(
      {required this.context,
      required this.bottomSheetLabel,
      required this.bottomSheetDescription,
      required this.bottomSheetButtons}) {
    _modalBottomSheetMenu();
  }

  void _modalBottomSheetMenu() async {
    showModalBottomSheet(backgroundColor:AppColors.transparentColor,
        context: context,
        builder: (builder) {
          return new Container(
            color: AppColors.transparentColor,
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: AppColors.bottomSheetBGColor,
                    borderRadius: new BorderRadius.only(
                        topLeft:  Radius.circular(SizeConfig.btnRadius*2),
                        topRight:  Radius.circular(SizeConfig.btnRadius*2))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: SizeConfig.padding,
                    ),
                    bottomSheetLabel,
                    SizedBox(
                      height: SizeConfig.padding,
                    ),
                    bottomSheetDescription,
                    SizedBox(
                      height: SizeConfig.padding,
                    ),
                    bottomSheetButtons,
                    SizedBox(
                      height: SizeConfig.padding,
                    ),
                  ],
                )),
          );
        });
  }

}
