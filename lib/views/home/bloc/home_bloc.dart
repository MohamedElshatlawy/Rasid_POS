import 'package:flutter/material.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/views/pay/view/pay_view.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  String payNumber = '0';
  BehaviorSubject<String> _subjectCounter = BehaviorSubject<String>();
  Stream<String> get counterObservable => _subjectCounter.stream;
  HomeBloc({required this.payNumber}) {
    _subjectCounter = BehaviorSubject<String>.seeded(this.payNumber);
  }

  void buttonPressed(var buttonText, context) {
    if (buttonText == 'الغاء') {
      payNumber = "0";
    } else if (buttonText == 'مسح') {
      payNumber = payNumber.substring(0, payNumber.length - 1);

      if (payNumber == "") {
        payNumber = "0";
      }
    } else if (buttonText == 'دفع') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PayView()));
    } else {
      if ((buttonText == "0" || buttonText == "00" || buttonText == "000") &&
          payNumber == '0') {
        payNumber = "0";
      } else {
        payNumber = (payNumber != '0' ? payNumber : '') + buttonText;
      }
    }
    if (buttonText != 'دفع') {
      _subjectCounter.sink.add(payNumber);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectCounter.close();
  }
}
