import 'package:flutter/material.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class TransiactionBloc extends BlocBase {
  DateTime firstSelectedDate = DateTime.now();
  DateTime endSelectedDate = DateTime.now();
  BehaviorSubject _firstSelectedDateValues = BehaviorSubject();
  BehaviorSubject _endSelectedDateValues = BehaviorSubject();
  Stream get firstSelectedDateStream => _firstSelectedDateValues.stream;
  Stream get endSelectedDateStream => _endSelectedDateValues.stream;

  TransiactionBloc(
      {required this.firstSelectedDate, required this.endSelectedDate}) {
    _firstSelectedDateValues = BehaviorSubject.seeded(this.firstSelectedDate);
    _endSelectedDateValues = BehaviorSubject.seeded(this.endSelectedDate);
  }
  Future<void> firstSelectDate(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: firstSelectedDate,
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(2101));
    if (picked != null && picked != firstSelectedDate)
      firstSelectedDate = picked;
    _firstSelectedDateValues.sink.add(firstSelectedDate);
  }

  Future<void> endSelectDate(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endSelectedDate,
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(2101));
    if (picked != null && picked != endSelectedDate) endSelectedDate = picked;
    _endSelectedDateValues.sink.add(endSelectedDate);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstSelectedDateValues.close();
    _endSelectedDateValues.close();
  }
}
