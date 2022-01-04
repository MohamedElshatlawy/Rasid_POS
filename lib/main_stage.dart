import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rasid_jack/base/flavor_config.dart';

import 'base/main_app.dart';
import 'utilities/connection_status_singleton.dart';
import 'utilities/localization/localizations.dart';

Future main() async {
  configuredFlavor = FlavorConfig(
      appTitle: AppLocalizations().stage,
      baseUrl: 'http://rasid-staging.tasaheel.org/',
      baseMediaUrl: 'http://rasid-staging.tasaheel.org/',
      mediaUrl: 'http://rasid-staging.tasaheel.org/',
      flavor: Flavors.stage,
      child: MainApp());
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  print(configuredFlavor.flavor);
  return runApp(configuredFlavor);
}
