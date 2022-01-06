import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_model.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/utilities/network/api_constants.dart';
import 'package:rasid_jack/utilities/network/network.dart';
import 'package:rasid_jack/utilities/utilities.dart';

mixin LoginRepo {
  Future loginRequest(Map<String, dynamic> params) async {
    try {
      var response = await Network()
          .performRequest(ApiConstants.TEST, params, ServerMethods.POST);
      print('successsss');
      return UserModel.fromJson(response.data);
    } catch (e) {
      print('errrorssss');
      return ErrorModel(error: [e.toString()]);
    }
  }
}
