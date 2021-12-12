import 'package:flutter/material.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';

class TitleAndDescription extends StatelessWidget {
  final String label;
  final String descriptionLabel;

  const TitleAndDescription(
      {Key? key, required this.label, required this.descriptionLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: AppText(
            label: label,
            style: AppFontStyle.bahijSansArabic(
                fontSize: SizeConfig.titleFontSize * 1.40,
                fontColor: AppColors.whiteColor),
          ),
        ),
        if (descriptionLabel.isNotEmpty)
          SizedBox(height: SizeConfig.blockSizeVertical),
        if (descriptionLabel.isNotEmpty)
          Center(
            child: AppText(
              label: descriptionLabel,
              style: AppFontStyle.bahijSansArabic(
                  fontSize: SizeConfig.textFontSize,
                  fontColor: AppColors.medGreyLightColor),
            ),
          ),
      ],
    );
  }
}
