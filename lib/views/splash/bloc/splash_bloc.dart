import 'package:rasid_jack/base/api_bloc_mixin.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/request_state.dart';
import 'package:rasid_jack/common/request_status.dart';
import 'package:rasid_jack/views/splash/repo/splash_repo.dart';
import 'package:rxdart/rxdart.dart';

class SplashBloc extends BlocBase
    with APIBlocMixin<UserModel, ErrorModel>, SplashRepo {
  BehaviorSubject<RequestState> requestStateSubject = BehaviorSubject.seeded(
      RequestState(status: RequestStatus.LOADING, message: ''));

  TEST() async {
    requestStateSubject.sink
        .add(RequestState(status: RequestStatus.LOADING, message: 'LOADING'));
    var model = await testRequest();

    if (model is UserModel) {
      super.successSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.SUCCESS, message: 'SUCCESS'));
    }
    if (model is ErrorModel) {
      super.errorSubject.sink.add(model);
      requestStateSubject.sink
          .add(RequestState(status: RequestStatus.ERROR, message: 'ERROR'));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    requestStateSubject.close();
  }
}
