import 'package:flutter/material.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/views/pay/view/pay_view.dart';
import 'package:rxdart/rxdart.dart';

class BuyWithCashBloc extends BlocBase {
  String payNumber = '0';
  String cashNumber = '0';
  bool isSelect = true;
  BehaviorSubject<String> _subjectCounter = BehaviorSubject<String>();
  Stream<String> get counterObservable => _subjectCounter.stream;
  BehaviorSubject<String> _subjectCash = BehaviorSubject<String>();
  Stream<String> get cashObservable => _subjectCash.stream;
  BuyWithCashBloc({required this.payNumber, required this.cashNumber}) {
    _subjectCounter = BehaviorSubject<String>.seeded(this.payNumber);
    _subjectCash = BehaviorSubject<String>.seeded(this.cashNumber);
  }

  void chooseInput(bool flag) {
    isSelect = flag;
    print(flag);
  }

  void buttonPressed(var buttonText, context) {
    print('object${isSelect}');
    if (buttonText == 'الغاء') {
      if (isSelect) {
        payNumber = "0";
      } else {
        cashNumber = "0";
      }
    } else if (buttonText == 'مسح') {
      if (isSelect) {
        payNumber = payNumber.substring(0, payNumber.length - 1);
        if (payNumber == "") {
          payNumber = "0";
        }
      } else {
        cashNumber = cashNumber.substring(0, cashNumber.length - 1);
        if (cashNumber == "") {
          cashNumber = "0";
        }
      }
    } else if (buttonText == 'دفع') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PayView()));
    } else {
      if ((buttonText == "0" || buttonText == "00" || buttonText == "000") &&
          (payNumber == "0" || cashNumber == "0")) {
        print('lsssssssssssss');
        if (isSelect) {
          payNumber = payNumber == '0' ? "0" : payNumber + buttonText;
        } else {
          cashNumber = cashNumber == '0' ? "0" : cashNumber + buttonText;
        }
      } else {
        print('sssfdfdew');

        if (isSelect) {
          payNumber = (payNumber != '0' ? payNumber : '') + buttonText;
        } else {
          cashNumber = (cashNumber != '0' ? cashNumber : '') + buttonText;
        }
      }
    }
    if (buttonText != 'دفع') {
      if (isSelect) {
        _subjectCounter.sink.add(payNumber);
      } else {
        _subjectCash.sink.add(cashNumber);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectCounter.close();
    _subjectCash.close();
  }
}
