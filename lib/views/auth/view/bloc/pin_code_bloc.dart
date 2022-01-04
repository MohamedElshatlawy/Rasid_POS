import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rasid_jack/base/api_bloc_mixin.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/request_state.dart';
import 'package:rasid_jack/common/request_status.dart';
import 'package:rasid_jack/utilities/validations.dart';
import 'package:rasid_jack/views/auth/view/change_password_view.dart';
import 'package:rasid_jack/views/auth/view/model/pin_code_model.dart';
import 'package:rasid_jack/views/auth/view/repo/pin_code_repo.dart';
import 'package:rxdart/rxdart.dart';

class PinCodeBloc extends BlocBase
    with APIBlocMixin<PinCodeModel, ErrorModel>, PinCodeRepo, Validations {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
      RequestState(status: RequestStatus.LOADING, message: ''));

  BehaviorSubject<String> pinCodeSubject = BehaviorSubject.seeded("");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final pinCodeTextEditingController = BehaviorSubject();
  Function(String) get updatepinCode => pinCodeTextEditingController.sink.add;

  FocusNode pinCodeFocusNode = FocusNode();
  pinCode(context, String email) async {
    Map<String, dynamic> params = new Map();
    params['email'] = email;
    params['forget_code'] = pinCodeTextEditingController.value.toString();

    requestStateSubject.sink
        .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
    var model = await pinCodeRequest(params);

    if (model is PinCodeModel) {
      super.successSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.SUCCESS, message: 'SUCCESS'));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ChangePasswordView()));
    }
    if (model is ErrorModel) {
      super.errorSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.ERROR, message: 'ERROR'));
      pinCodeSubject.sink.addError('error from api');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    requestStateSubject.close();
    pinCodeSubject.close();
    pinCodeTextEditingController.close();
  }
}
