import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rasid_jack/base/api_bloc_mixin.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/request_state.dart';
import 'package:rasid_jack/common/request_status.dart';
import 'package:rasid_jack/utilities/validations.dart';
import 'package:rasid_jack/views/home/view/home_view.dart';

import 'package:rasid_jack/views/profile/model/profile_model.dart';
import 'package:rasid_jack/views/profile/repo/profile_repo.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends BlocBase
    with APIBlocMixin<ProfileModel, ErrorModel>, ProfileRepo, Validations {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
      RequestState(status: RequestStatus.LOADING, message: ''));

  BehaviorSubject<bool> obscureTextSubject = BehaviorSubject.seeded(true);

  BehaviorSubject<String> nameSubject = BehaviorSubject.seeded("");
  BehaviorSubject<String> emailSubject = BehaviorSubject.seeded("");
  BehaviorSubject<String> phoneNumSubject = BehaviorSubject.seeded("");
  BehaviorSubject<String> statementNumSubject = BehaviorSubject.seeded("");
  BehaviorSubject<String> idNumSubject = BehaviorSubject.seeded("");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneNumTextEditingController = TextEditingController();
  TextEditingController statementNumTextEditingController =
      TextEditingController();
  TextEditingController idNumTextEditingController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode phoneNumFocusNode = FocusNode();
  FocusNode statementNumFocusNode = FocusNode();
  FocusNode idNumFocusNode = FocusNode();

  String? nameValue;
  String? emailValue;
  String? phoneValue;
  String? statementNumValue;
  String? idNumValue;
  int? id;
  getProfileData() async {
    requestStateSubject.sink
        .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
    var model = await getProfileInfoRequest();

    if (model is ProfileModel) {
      print('sssssssssssaaaa ${model.data!.name}');
      super.successSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.SUCCESS, message: 'SUCCESS'));
      nameValue = model.data!.name;
      emailValue = model.data!.email;
      phoneValue = model.data!.phone;
      statementNumValue = model.data!.serialNumber;
      idNumValue = model.data!.identificationNumber;
      id = model.data!.id;
    }
    if (model is ErrorModel) {
      super.errorSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.ERROR, message: 'ERROR'));
    }
    return model;
  }

  profile(context) async {
    Map<String, dynamic> params = new Map();
    params['name'] = nameTextEditingController.value.text;
    params['email'] = emailTextEditingController.value.text;

    requestStateSubject.sink
        .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
    var model = await postProfileInfoRequest(params, id!.toInt());
    print('objectddddddd${nameTextEditingController.value.text}');
    print('sssssww${emailTextEditingController.value.text}');
    print('sssssww${id}');
    if (model is ProfileModel) {
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
      nameSubject.sink.addError('error from api');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    requestStateSubject.close();
    nameSubject.close();
    emailSubject.close();
    phoneNumSubject.close();
    statementNumSubject.close();
    idNumSubject.close();
    obscureTextSubject.close();
  }
}
