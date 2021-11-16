import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rasid_jack/common/models/error_model.dart';
import 'package:rasid_jack/common/widgets/loading_dialog.dart';
import 'package:rasid_jack/common/blocs/Logout/Bloc/logout_bloc.dart';
import 'package:rasid_jack/utilities/connection_status_singleton.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';
import 'package:rasid_jack/utilities/constants/app_font_styls.dart';
import 'package:rasid_jack/utilities/helper_methods.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:rasid_jack/utilities/size_config.dart';
import 'api_bloc_mixin.dart';
import 'dialog/services/dialog_service.dart';

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

abstract class BaseStatefulWidget extends StatefulWidget {}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T>
    with RouteAware, WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  LogoutBloc? logoutBloc;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    logoutBloc = LogoutBloc();
    listenForResponse(logoutBloc!, errorAction: () {}).listen((data) {
      hideDialog();
     // Navigator.pushNamedAndRemoveUntil(context, "/wayToLogin", (r) => false);
    });
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    connectionStatus.connectionChange.listen((connectionChanged));
  }

  void connectionChanged(dynamic hasConnection) {
    isOffline = !hasConnection;
    if (isOffline) {
      showAppDialog(
          title: AppLocalizations.of(context).alert,
          errorMessage: AppLocalizations.of(context).noInternetConnection,
          okButtonTitle: AppLocalizations.of(context).ok);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        floatingActionButton: getFloatingActionButton(),
        resizeToAvoidBottomInset: true,
        // backgroundColor: LIGHT_GREY,
        key: getScreenKey,
        appBar: getAppbar(),
        drawer: getDrawer(),
        body: GestureDetector(
            onTap: () => HelperMethods.unFocusKeyboard(),
            child: getBody(context)),
          bottomNavigationBar: getBottomNavigationBar(),
      ),
    );
  }

  Stream listenForResponse(APIBlocMixin blocMixin, {Function? errorAction}) {
    _listenForError(blocMixin, errorAction: errorAction);
    return blocMixin.successStream;
  }

  _listenForError(APIBlocMixin blocMixin, {Function? errorAction}) {
    blocMixin.errorStream.listen((data) {
      hideDialog();
      ErrorModel error = data as ErrorModel;
      String? errorMessage = error.error?.first;
      showAppDialog(
          title: AppLocalizations.of(context).alert,
          errorMessage: errorMessage ?? '',
          okButtonTitle: AppLocalizations.of(context).ok);
    });
  }

  Future<void> showAppDialog(
      {required String title,
      required String errorMessage,
      required String okButtonTitle,
      String? cancelButtonTitle}) async {
    var dialogResult = await dialogService.showDialog(
        title: title,
        description: errorMessage,
        okButtonTitle: okButtonTitle,
        cancelButtonTitle: cancelButtonTitle);

    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }

  Widget? getDrawer() {
    return null;
  }

  Widget? getBottomNavigationBar() {
    return null;
  }

  String getTitle() {
    return '';
  }

  Widget? getFloatingActionButton() {
    return null;
  }

  PreferredSizeWidget? getAppbar() {
    return AppBar(
      actions: buildBarPopup(),
      // leading: buildBackButton(),
      centerTitle: true,
      brightness: Brightness.light,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.PRIMARY_COLOR,
      elevation: 0.0,
      title: Text(
        getTitle(),
        style: AppFontStyle.latoBold(16, Colors.white),
      ),
    );
  }

  Future<bool> onWillPop() {
    Navigator.pop(context);
    return Future.value(false);
  }

  List<Widget>? buildBarPopup() {
    return null;
  }

  Widget buildBackButton() {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Image(
        image: AssetImage(AppAssets.BACK_BTN),
      ),
    );
  }

  void logout() {
    showLoadingDialog();
    logoutBloc?.logout();
  }
  get getScreenKey {
    return _scaffoldKey;
  }

  Widget getBody(BuildContext context);

  @override
  void dispose() {
    super.dispose();
  }

  getNotConnectedBody() {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.3,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Strings.getNoInternetConnection()',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Container(
            height: 20.0,
          ),
          Text('Strings.getNoInternetConnection()',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500))
        ],
      ),
    ));
  }

  LoadingDialog loadingDialog = new LoadingDialog();

  // ignore: missing_return
  Future<void>? hideDialog() {
    if (loadingDialog != null && loadingDialog.isShowing()) {
      // Navigator.of(loadingDialog.).pop();
      loadingDialog.pop();
      loadingDialog = new LoadingDialog();
    }
  }

  void showLoadingDialog() async {
    if (loadingDialog == null) loadingDialog = LoadingDialog();
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => loadingDialog);
  }

  void showSnack(String msg) async {
    await hideDialog();
    //  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //routeObserver.subscribe(this, ModalRoute.of(context)); temp fix for calling getbody twice
  }

  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    debugPrint("didPopNext $runtimeType");
    setState(() {});
  }
}
