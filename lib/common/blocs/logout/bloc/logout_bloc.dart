import 'package:rasid_jack/base/api_bloc_mixin.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/blocs/logout/repo/logout_repo.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/success_model.dart';
import 'package:rasid_jack/utilities/shared_preferences_helper.dart';

class LogoutBloc extends BlocBase
    with APIBlocMixin<SuccessModel, ErrorModel>, LogoutRepo {
  logout() async {
    var model = await logoutRequest();
    if (model is SuccessModel) {
      SharedPreferenceHelper.removeAllKeys();
      successSubject.sink.add(model);
    }
    if (model is ErrorModel) {
      super.errorSubject.sink.add(model);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
