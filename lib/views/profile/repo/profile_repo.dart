import 'package:rasid_jack/base/base_model.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/utilities/network/api_constants.dart';
import 'package:rasid_jack/utilities/network/network.dart';
import 'package:rasid_jack/views/profile/model/profile_model.dart';

mixin ProfileRepo {
  Future<BaseModel> getProfileInfoRequest() async {
    try {
      var response = await Network()
          .performRequest(ApiConstants.GETPROFILEINFO, {}, ServerMethods.GET);
      if (response.data['code'] == 200) {
        print('eeeeeeeeeee${response.data}');
        return ProfileModel.fromJson(response.data);
      } else {
        return ErrorModel(error: [response.data['errors'].toString()]);
      }
    } catch (e) {
      print('errrorssss');
      return ErrorModel(error: [e.toString()]);
    }
  }

  Future<BaseModel> postProfileInfoRequest(
      Map<String, dynamic> params, int id) async {
    try {
      var response = await Network().performRequest(
          ApiConstants.PROFILE + "/${id}", params, ServerMethods.POST);
      if (response.data['code'] == 200) {
        print('ssseeeee${response.data}');
        return ProfileModel.fromJson(response.data);
      } else {
        return ErrorModel(error: [response.data['errors'].toString()]);
      }
    } catch (e) {
      print('errrorssss');
      return ErrorModel(error: [e.toString()]);
    }
  }
}
