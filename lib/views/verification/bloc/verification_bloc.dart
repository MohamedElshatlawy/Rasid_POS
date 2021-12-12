// import 'package:flutter/cupertino.dart';
// import 'package:rasid_jack/base/api_bloc_mixin.dart';
// import 'package:rasid_jack/base/bloc_provider.dart';
// import 'package:rasid_jack/common/models/error_model.dart';
// import 'package:rasid_jack/common/models/user_model.dart';
// import 'package:rasid_jack/common/request_state.dart';
// import 'package:rasid_jack/common/request_status.dart';
// import 'package:rasid_jack/views/forgot_password/repo/forgot_password_repo.dart';
// import 'package:rxdart/rxdart.dart';

// class VerificationBloc extends BlocBase
//     with APIBlocMixin<UserModel, ErrorModel>, ForgotPasswordRepo {
//   BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
//       RequestState(status: RequestStatus.LOADING, message: ''));
//   BehaviorSubject<String> emailSubject = BehaviorSubject.seeded("");
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController emailTextEditingController = TextEditingController();

//   FocusNode emailFocusNode = FocusNode();

//   verify() async {
//     Map<String, dynamic> params = new Map();
//     params['email'] = emailSubject.value;

//     requestStateSubject.sink
//         .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
//     var model = await forgotPasswordRequest(params);

//     if (model is UserModel) {
//       super.successSubject.sink.add(model);
//       requestStateSubject.sink
//           .add(RequestState(status: RequestStatus.SUCCESS, message: 'SUCCESS'));
//     }
//     if (model is ErrorModel) {
//       super.errorSubject.sink.add(model);
//       requestStateSubject.sink
//           .add(RequestState(status: RequestStatus.ERROR, message: 'ERROR'));
//     }
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     requestStateSubject.close();
//     emailSubject.close();
//   }
// }
