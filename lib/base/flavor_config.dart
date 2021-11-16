import 'package:flutter/cupertino.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';

import 'main_app.dart';
enum Flavors {
  prod,
  dev,
  stage,
}
class FlavorConfig extends InheritedWidget {
  final String appTitle;
  final String baseUrl;
  final String baseMediaUrl;
  final String mediaUrl;
  final Flavors flavor;
  final Widget child;

  FlavorConfig(
      {required this.appTitle,
      required this.baseUrl,
      required this.baseMediaUrl,
      required this.mediaUrl,
      required this.flavor,
      required this.child})
      : super(child: child);

  static FlavorConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlavorConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

FlavorConfig configuredFlavor = FlavorConfig(
    appTitle: AppLocalizations().dev,
    baseUrl: 'https://baseetmobapi.smartwaveeg.com/api/',
    baseMediaUrl: 'https://baseetmobapi.smartwaveeg.com/api/',
    mediaUrl: 'https://baseetmobapi.smartwaveeg.com/api/',
    flavor: Flavors.dev,
    child: MainApp());
