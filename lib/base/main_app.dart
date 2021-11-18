import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasid_jack/views/auth/view/login_view.dart';

import 'dialog/managers/dialog_manager.dart';
import '../utilities/constants/app_colors.dart';
import '../utilities/localization/locale_helper.dart';
import '../utilities/localization/localizations.dart';
import 'flavor_config.dart';

// Future<void> main() async {
//   HttpOverrides.global = new MyHttpOverrides();
//   WidgetsFlutterBinding.ensureInitialized();
//   ConnectionStatusSingleton connectionStatus =
//       ConnectionStatusSingleton.getInstance();
//   connectionStatus.initialize();
//   return runApp(MyApp());
// }

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  SpecificLocalizationDelegate? _specificLocalizationDelegate;
  final _navigationKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper.onLocaleChanged = onLocaleChange;
    _specificLocalizationDelegate =
        SpecificLocalizationDelegate(new Locale('ar'));
  }

  onLocaleChange(Locale locale) {
    if (this.mounted) {
      setState(() {
        _specificLocalizationDelegate =
            new SpecificLocalizationDelegate(locale);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: () => MaterialApp(
        navigatorKey: _navigationKey,
        title: configuredFlavor.appTitle,
        color: AppColors.PRIMARY_COLOR,
        theme: ThemeData(
            fontFamily: 'Bahij_TheSansArabic',
            canvasColor: Colors.transparent,
            textTheme:
                TextTheme(bodyText2: TextStyle(color: AppColors.WHITH_COLOR))),
        debugShowCheckedModeBanner:
            configuredFlavor.flavor == Flavors.prod ? false : true,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          _specificLocalizationDelegate!
        ],
        supportedLocales: [Locale('en'), Locale('ar')],
        locale: _specificLocalizationDelegate?.overriddenLocale,
        builder: (context, widget) => Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(
                    child: widget,
                  )),
        ),
        // home: BlocProvider<SplashBloc>(bloc: SplashBloc(), child: SplashView()),
        home: LoginView(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
