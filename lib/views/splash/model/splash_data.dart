
import 'package:rasid_jack/base/flavor_config.dart';
import 'package:rasid_jack/utilities/network/api_constants.dart';

class SplashData {
  String? url;

  SplashData({this.url});

  factory SplashData.fromJson(Map<String, dynamic> json) {
    // todo replace by json
    return SplashData(url: configuredFlavor.baseUrl);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}