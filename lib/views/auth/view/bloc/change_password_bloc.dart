import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rasid_jack/base/api_bloc_mixin.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/request_state.dart';
import 'package:rasid_jack/common/request_status.dart';
import 'package:rasid_jack/utilities/utilities.dart';
import 'package:rasid_jack/utilities/validations.dart';
import 'package:rasid_jack/views/auth/view/model/forget_model.dart';
import 'package:rasid_jack/views/auth/view/repo/change_password_repo.dart';
import 'package:rasid_jack/views/auth/view/repo/login_repo.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rxdart/rxdart.dart';

class ChangePasswordBloc extends BlocBase
    with
        APIBlocMixin<ForgetPasswordModel, ErrorModel>,
        ChangePasswordRepo,
        Validations {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
      RequestState(status: RequestStatus.LOADING, message: ''));
  BehaviorSubject<bool> obscureTextSubject = BehaviorSubject.seeded(true);

  BehaviorSubject<String> passwordSubject = BehaviorSubject.seeded("");
  BehaviorSubject<String> confirmPasswordSubject = BehaviorSubject.seeded("");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  changePassword(context) async {
    Map<String, dynamic> params = new Map();
    params['password'] = passwordTextEditingController.value.text;
    params['password_confirmation'] =
        confirmPasswordTextEditingController.value.text;

    requestStateSubject.sink
        .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
    var model = await changePasswordRequest(params);

    if (model is ForgetPasswordModel) {
      super.successSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.SUCCESS, message: 'SUCCESS'));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    }
    if (model is ErrorModel) {
      super.errorSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.ERROR, message: 'ERROR'));
      passwordSubject.sink.addError('error from api');
      confirmPasswordSubject.sink.addError('error from api');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    requestStateSubject.close();
    obscureTextSubject.close();
    confirmPasswordSubject.close();
    passwordSubject.close();
  }
}
