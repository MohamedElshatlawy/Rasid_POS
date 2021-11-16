import 'package:rasid_jack/base/base_model.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/success_model.dart';
import 'package:rasid_jack/utilities/network/network.dart';

mixin LogoutRepo {
  Future<BaseModel> logoutRequest() async {
    try {
      var response =
          await Network().performRequest('LOGOUT_API', {}, ServerMethods.POST);
      return SuccessModel.fromJson(response.data);
    } catch (e) {
      //dynamic t = e;
      return ErrorModel.fromJson(e as dynamic);
    }
  }
}
