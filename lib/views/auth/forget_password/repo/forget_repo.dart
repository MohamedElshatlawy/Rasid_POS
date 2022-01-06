import 'dart:convert';

import 'package:rasid_jack/base/base_model.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/utilities/network/api_constants.dart';
import 'package:rasid_jack/utilities/network/network.dart';
import 'package:rasid_jack/views/auth/forget_password/model/forget_model.dart';

mixin ForgetPasswordRepo {
  Future<BaseModel> forgetPasswordRequest(Map<String, dynamic> params) async {
    try {
      var response = await Network().performRequest(
          ApiConstants.FORGETPASSWORd, params, ServerMethods.POST);
      // if (response.data['code'] == 200) {
      //   print('eeeeeeeeeee${response}');
      return ForgetPasswordModel.fromJson(jsonDecode(response.toString()));
      // } else {
      //   return ErrorModel(error: [response.data['errors'].toString()]);
      // }
    } catch (e) {
      print('errrorssss');
      return ErrorModel(error: [e.toString()]);
    }
  }
}
