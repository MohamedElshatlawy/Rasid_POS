import 'dart:convert';

import 'package:rasid_jack/base/base_model.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/utilities/network/api_constants.dart';
import 'package:rasid_jack/utilities/network/network.dart';
import 'package:rasid_jack/utilities/utilities.dart';

mixin LoginRepo {
  Future<BaseModel> loginRequest(Map<String, dynamic> params) async {
    try {
      var response = await Network()
          .performRequest(ApiConstants.TEST, params, ServerMethods.POST);
      if (response.data['code'] == 200) {
        print('eeeeeeeeeee${response.data['data']['name']}');
        await Utilities.setCurrentUser(UserModel.fromJson(response.data));

        return UserModel.fromJson(response.data);
      } else {
        return ErrorModel(error: [response.data['errors'].toString()]);
      }
    } catch (e) {
      // List errorList = ErrorModel(error: [e.toString()]).error!.toList();
      print('errrorssss');

      return ErrorModel(error: [e.toString()]);
    }
  }
}
