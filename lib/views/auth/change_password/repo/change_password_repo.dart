import 'dart:convert';

import 'package:rasid_jack/base/base_model.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/utilities/network/api_constants.dart';
import 'package:rasid_jack/utilities/network/network.dart';
import 'package:rasid_jack/utilities/utilities.dart';
import 'package:rasid_jack/views/auth/forget_password/model/forget_model.dart';

mixin ChangePasswordRepo {
  Future<BaseModel> changePasswordRequest(Map<String, dynamic> params) async {
    try {
      var response = await Network().performRequest(
          ApiConstants.CHANGEPASSWORD, params, ServerMethods.POST);
      // if (response.data['code'] == 200) {
      //   print('eeeeeeeeeee${response.data['data']}');
      //   await Utilities.setCurrentUser(UserModel.fromJson(response.data));

      return ForgetPasswordModel.fromJson(response.data);
      // } else {
      //   return ErrorModel(error: [response.data['errors'].toString()]);
      // }
    } catch (e) {
      // List errorList = ErrorModel(error: [e.toString()]).error!.toList();
      print('errrorssss');

      return ErrorModel(error: [e.toString()]);
    }
  }
}
