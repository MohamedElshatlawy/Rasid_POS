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
      _subjectCounter.sink.add(payNumber);
    } else if (buttonText == 'مسح') {
      payNumber = payNumber.substring(0, payNumber.length - 1);
      _subjectCounter.sink.add(payNumber);

      if (payNumber == "") {
        payNumber = "0";
        _subjectCounter.sink.add(payNumber);
      }
    } else if (buttonText == 'دفع') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PayView()));
    } else {
      if (payNumber == "0") {
        payNumber = buttonText;
        _subjectCounter.sink.add(payNumber);
      } else {
        payNumber = payNumber + buttonText;
        _subjectCounter.sink.add(payNumber);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectCounter.close();
  }
}
