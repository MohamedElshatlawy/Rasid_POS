import 'dart:async';

import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ForgetPasswordBloc extends BlocBase {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;
  String timerText;
  bool visibility = true;
  BehaviorSubject _timerValues = BehaviorSubject();
  Stream get timerValuesStream => _timerValues.stream;
  ForgetPasswordBloc({required this.timerText}) {
    _timerValues = BehaviorSubject.seeded(this.timerText);
  }

  startTimeout(context) {
    var duration = interval;
    visibility = false;
    Timer.periodic(duration, (timer) {
      print(timer.tick);
      currentSeconds = timer.tick;
      if (timer.tick >= timerMaxSeconds) {
        timer.cancel();
        visibility = true;
      }
      timerText =
          '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
      _timerValues.sink.add(timerText);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timerValues.close();
  }
}
