import 'package:flutter/material.dart';
import 'package:rasid_jack/base/base_stateful_widget.dart';
import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rasid_jack/common/models/user_model.dart';
import 'package:rasid_jack/common/widgets/streaming_result.dart';
import 'package:rasid_jack/utilities/shared_preferences_helper.dart';
import 'package:rasid_jack/views/splash/bloc/splash_bloc.dart';

class SplashView extends BaseStatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  late SplashBloc _splashBloc;

  @override
  void initState() {
    super.initState();
    SharedPreferenceHelper();
    _splashBloc = BlocProvider.of<SplashBloc>(context);
    _splashBloc.TEST();
    listenForResponse(_splashBloc).listen((event) {});
  }

  @override
  Widget getBody(BuildContext context) {
    // TODO: implement getBody
    return StreamBuilder<UserModel>(
        stream: _splashBloc.successStream,
        builder: (context, AsyncSnapshot<UserModel> snapshot) {
          return StreamingResult(
              subject: _splashBloc.requestStateSubject,
              successWidget: Text(_splashBloc.requestStateSubject.value.message));
        });
  }


}
