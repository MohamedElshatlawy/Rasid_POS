import 'package:rasid_jack/base/base_model.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/utilities/network/api_constants.dart';
import 'package:rasid_jack/utilities/network/network.dart';

mixin SplashRepo {
  Future<BaseModel> testRequest() async {
    Map<String, dynamic> parms = new Map();
    parms['userName'] = 'rererererere';
    parms['password'] = 'rererererer';
    parms['socialToken'] = null;
    try {
      var response = await Network()
          .performRequest(ApiConstants.TEST, parms, ServerMethods.POST);
      return UserModel.fromJson(response.data);
    } catch (e) {
      return ErrorModel.fromJson(e as dynamic);
    }
  }
}
