import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rasid_jack/base/api_bloc_mixin.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/request_state.dart';
import 'package:rasid_jack/common/request_status.dart';
import 'package:rasid_jack/utilities/validations.dart';
import 'package:rasid_jack/views/auth/view/pin_code_view.dart';
import 'package:rasid_jack/views/auth/view/model/forget_model.dart';
import 'package:rasid_jack/views/auth/view/repo/forget_repo.dart';
import 'package:rasid_jack/views/auth/view/repo/login_repo.dart';
import 'package:rxdart/rxdart.dart';

class ForgetPasswordBloc extends BlocBase
    with
        APIBlocMixin<ForgetPasswordModel, ErrorModel>,
        ForgetPasswordRepo,
        Validations {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
      RequestState(status: RequestStatus.LOADING, message: ''));
  BehaviorSubject<String> emailSubject = BehaviorSubject.seeded("");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  forgetPassword(context) async {
    Map<String, dynamic> params = new Map();
    params['email'] = emailTextEditingController.value.text;

    requestStateSubject.sink
        .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
    var model = await forgetPasswordRequest(params);

    if (model is ForgetPasswordModel) {
      super.successSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.SUCCESS, message: 'SUCCESS'));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PinCodeView(email: emailTextEditingController.value.text)));
    }
    if (model is ErrorModel) {
      super.errorSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.ERROR, message: 'ERROR'));
      emailSubject.sink.addError('error from api');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    requestStateSubject.close();
    emailSubject.close();
  }
}
