import 'package:flutter/cupertino.dart';
import 'package:rasid_jack/base/api_bloc_mixin.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/base/dialog/services/dialog_service.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/request_state.dart';
import 'package:rasid_jack/common/request_status.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/helper_methods.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/validations.dart';
import 'package:rasid_jack/views/auth/login/repo/login_repo.dart';
import 'package:rxdart/rxdart.dart';

class ContactUsBloc extends BlocBase
    with APIBlocMixin<UserModel, ErrorModel>, LoginRepo, Validations {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
      RequestState(status: RequestStatus.LOADING, message: ''));
  BehaviorSubject<String> nameSubject = BehaviorSubject.seeded("");
  BehaviorSubject<String> phoneNumberSubject = BehaviorSubject.seeded("");
  BehaviorSubject<String> messageSubject = BehaviorSubject.seeded("");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();

  FocusNode idFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  BehaviorSubject<City> selectedRegionSubject =
      BehaviorSubject.seeded(City(id: 0, title: ''));
  BehaviorSubject<Color> regionContainerBorderColorSubject =
      BehaviorSubject.seeded(AppColors.GRAY_COLOR);
  BehaviorSubject<City> selectedCitySubject =
      BehaviorSubject.seeded(City(id: 0, title: ''));
  BehaviorSubject<Color> cityContainerBorderColorSubject =
      BehaviorSubject.seeded(AppColors.GRAY_COLOR);
  BehaviorSubject<City> selectedBranchSubject =
      BehaviorSubject.seeded(City(id: 0, title: ''));
  BehaviorSubject<Color> branchContainerBorderColorSubject =
      BehaviorSubject.seeded(AppColors.GRAY_COLOR);
  BehaviorSubject<Color> otpContainerBorderColorSubject =
      BehaviorSubject.seeded(AppColors.GRAY_COLOR);
  List<City> list = [
    City(id: 1, title: 'AAAA'),
    City(id: 2, title: 'BBBB'),
    City(id: 3, title: 'CCCC'),
    City(id: 4, title: 'DDDD'),
    City(id: 5, title: 'EEEE'),
  ];

  void clearBorderColor() {
    regionContainerBorderColorSubject.sink.add(AppColors.GRAY_COLOR);
    cityContainerBorderColorSubject.sink.add(AppColors.GRAY_COLOR);

    branchContainerBorderColorSubject.sink.add(AppColors.GRAY_COLOR);
    otpContainerBorderColorSubject.sink.add(AppColors.GRAY_COLOR);
  }

  void setDropDownBorderColor(BehaviorSubject subject) {
    clearBorderColor();
    HelperMethods.unFocusKeyboard();
    subject.sink.add(AppColors.accentColor);
  }

  login() async {
    // Map<String, dynamic> params = new Map();
    // params['id'] = idSubject.value;
    // params['password'] = passwordSubject.value;
    //
    // requestStateSubject.sink
    //     .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
    // var model = await loginRequest(params);

    // if (model is UserModel) {
    //   super.successSubject.sink.add(model);
    //   requestStateSubject.sink
    //       .add(RequestState(status: RequestStatus.SUCCESS, message: 'SUCCESS'));
    // }
    // if (model is ErrorModel) {
    //   super.errorSubject.sink.add(model);
    //   requestStateSubject.sink
    //       .add(RequestState(status: RequestStatus.ERROR, message: 'ERROR'));
    // }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    requestStateSubject.close();
    nameSubject.close();
    phoneNumberSubject.close();
    messageSubject.close();
    selectedRegionSubject.close();
    regionContainerBorderColorSubject.close();
    selectedCitySubject.close();
    cityContainerBorderColorSubject.close();
    selectedBranchSubject.close();
    branchContainerBorderColorSubject.close();
    otpContainerBorderColorSubject.close();
  }
}

class City {
  final int id;
  final String? title;

  City({required this.id, required this.title});

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };

  bool operator ==(dynamic other) =>
      other != null && other is City && this.id == other.id;

  @override
  int get hashCode => super.hashCode;
}
