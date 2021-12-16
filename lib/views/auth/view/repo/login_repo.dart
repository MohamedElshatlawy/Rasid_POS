import 'package:rasid_jack/base/base_model.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/utilities/network/api_constants.dart';
import 'package:rasid_jack/utilities/network/network.dart';

mixin LoginRepo {
  Future<BaseModel> loginRequest(Map<String, dynamic> params) async {
    try {
      var response = await Network()
          .performRequest(ApiConstants.TEST, params, ServerMethods.POST);
      return UserModel.fromJson(response.data);
    } catch (e) {
      return ErrorModel.fromJson(e as dynamic);
    }
  }
}
