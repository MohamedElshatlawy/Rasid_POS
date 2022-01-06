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
import 'package:rasid_jack/views/auth/login/repo/login_repo.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase
    with APIBlocMixin<UserModel, ErrorModel>, LoginRepo, Validations {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
      RequestState(status: RequestStatus.LOADING, message: ''));
  BehaviorSubject<bool> obscureTextSubject = BehaviorSubject.seeded(true);

  BehaviorSubject<String> emailSubject = BehaviorSubject.seeded("");
  BehaviorSubject<String> passwordSubject = BehaviorSubject.seeded("");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  login(context) async {
    Map<String, dynamic> params = new Map();
    params['email'] = emailTextEditingController.value.text;
    params['password'] = passwordTextEditingController.value.text;

    requestStateSubject.sink
        .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
    var model = await loginRequest(params);

    if (model is UserModel) {
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
      emailSubject.sink.addError('error from api');
      passwordSubject.sink.addError('error from api');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    requestStateSubject.close();
    obscureTextSubject.close();
    emailSubject.close();
    passwordSubject.close();
  }
}
