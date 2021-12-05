import 'package:flutter/material.dart';
import 'package:rasid_jack/common/blocs/timer/timer_bloc.dart';
import 'package:rasid_jack/common/widgets/app_button.dart';
import 'package:rasid_jack/common/widgets/app_text.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'package:rasid_jack/utilities/utilities.dart';

class TimerText extends StatelessWidget {
  final TimerBloc timerBloc;

  TimerText({required this.timerBloc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          label: AppLocalizations.of(context).requestNewCodeMessage,
          style: AppFontStyle.bahijLight(
              fontSize: SizeConfig.textFontSize,
              fontColor: AppColors.greyColor),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: StreamBuilder<int>(
                stream: timerBloc.timerStream,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    return AppText(
                      label: Utilities.formattedTime(snapshot.data ?? 120),
                      style: AppFontStyle.bahijLight(
                          fontSize: SizeConfig.textFontSize,
                          fontColor: AppColors.accentColor),
                    );
                  } else {
                    return AppText(
                      label: '01:59',
                      style: AppFontStyle.bahijLight(
                          fontSize: SizeConfig.textFontSize,
                          fontColor: AppColors.accentColor),
                    );
                  }
                })),
        StreamBuilder<bool>(
            stream: timerBloc.timerStoppedSubject.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              print(snapshot.data);
              if (snapshot.data ==null || snapshot.data == false) {
                return SizedBox();
              } else {
                return AppButton(
                    title: AppLocalizations.of(context).requestNewCode,
                    style: AppFontStyle.bahijSemiBold(
                        fontSize:  SizeConfig.textFontSize,
                        fontColor: AppColors.accentColor),
                    borderColor: AppColors.transparentColor,
                    backgroundColor: AppColors.transparentColor,
                    height: SizeConfig.btnHeight / 4 * 3,
                    onTap: () => timerBloc.incrementTimer(30));
              }
            })
      ],
    );
  }
}
