import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:rasid_jack/base/flavor_config.dart';
import 'package:rasid_jack/utilities/localization/localizations.dart';

import '../utilities.dart';
import 'api_constants.dart';

enum ServerMethods { GET, POST, UPDATE, DELETE, PUT }
enum Environment { mock, initial, base }

class Network {
  static final Network shared = new Network._private();
  static const UNAUTHORIZED_APIS = [
    ApiConstants.TEST,
  ];

  Dio client = Dio();
  Environment _environment = Environment.initial;

  String baseUrl = configuredFlavor.baseUrl;

  factory Network() {
    return shared;
  }

  Network._private() {
    client.options.connectTimeout = 120 * 1000;
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (_client) {
      _client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
  Future sendQueryParams(
      String endpoint, Map<String, dynamic> parms, ServerMethods method,
      {Map<String, dynamic>? putOrDeleteParams}) async {
    if (Utilities.getTokenHeader().isNotEmpty ||
        UNAUTHORIZED_APIS.contains(endpoint) ||
        endpoint.startsWith("mock")) {
      Map<String, dynamic>? queryParams = {};
      if (method == ServerMethods.GET) {
        queryParams = parms;
      } else if (method == ServerMethods.PUT ||
          method == ServerMethods.DELETE) {
        queryParams = putOrDeleteParams;
      }
      return _performRequest(endpoint,
          queryParms: parms, method: method.toString().split(".").last);
    }
  }

  Future performRequest(
      String endpoint, Map<String, dynamic> parms, ServerMethods method,
      {Map<String, dynamic>? putOrDeleteParams}) async {
    if (
    //Utilities.getTokenHeader().isNotEmpty ||
        UNAUTHORIZED_APIS.contains(endpoint) ||
        endpoint.startsWith("mock")) {
      Map<String, dynamic>? queryParams = {};
      if (method == ServerMethods.GET) {
        queryParams = parms;
      } else if (method == ServerMethods.PUT ||
          method == ServerMethods.DELETE) {
        queryParams = putOrDeleteParams;
      }
      return _performRequest(endpoint,
          queryParms: queryParams!,
          bodyParms: parms,
          method: method.toString().split(".").last);
    }
  }

  Future uploadFileRequest(
      String endpoint, FormData parms, ServerMethods? method,
      {Map<String, dynamic>? putOrDeleteParams}) async {
    return _performRequest2(endpoint,
        body: parms, method: method.toString().split(".").last);
  }

  Future _performRequest(String endpoint,
      {Map<String, dynamic>? bodyParms,
        Map<String, dynamic>? queryParms,
        String? method}) async {
    endpoint = _prepareEnvironment(endpoint);
    String headerToken =
    _environment != Environment.mock ? 'Utilities.getTokenHeader()' : "";
    Map<String, dynamic> headers =
    headerToken == "" ? {} : {"Authorization": headerToken};
    print('headerToken ${headers.toString()}' );
    try {
      print(bodyParms);
      print(queryParms);
      if (endpoint.toLowerCase().contains("upload")) {
        baseUrl = "${configuredFlavor.mediaUrl}api/";
      } else {
        baseUrl = configuredFlavor.baseUrl;
      }
      print('$method  =======>>    $baseUrl$endpoint');

      Response response = await client.request(baseUrl + endpoint,
          data: bodyParms,
          queryParameters: queryParms,
          options: Options(method: method, headers: headers));
      print("$endpoint: $response");
      return response;
    } on SocketException catch (e) {
      throw {
        "code": 500,
        "error": [AppLocalizations().noInternetConnection]
      };
    } on DioError catch (e) {
      print("$endpoint errorrrrrr=======>>  ${e.response!.data}");
      throw e.response!.data;
    }
  }

  Future _performRequest2(String endpoint, {body, String? method}) async {
    endpoint = _prepareEnvironment(endpoint);
    String headerToken =
    _environment != Environment.mock ? Utilities.getTokenHeader() : "";
    Map<String, dynamic> headers =
    headerToken == "" ? {} : {"Authorization": headerToken};
    print("headerToken " + headers.toString());
    try {
      if (endpoint.toLowerCase().contains("upload")) {
        baseUrl = "${configuredFlavor.mediaUrl}api/";
      } else {
        baseUrl = configuredFlavor.baseUrl;
      }
      print('$method  =======>>    $baseUrl$endpoint');
      Response response = await client.request(baseUrl + endpoint,
          data: body,
          options: Options(method: method, headers: headers));
      return response;
    } on SocketException catch (e) {
      throw {
        "code": 500,
        "error": [AppLocalizations().noInternetConnection]
      };
    } on DioError catch (e) {
      print("$endpoint errorrrrrr=======>>  ${e.response!.data}");
      throw e.response!.data;
    }
  }

  String _prepareEnvironment(String endpoint) {
    if (endpoint == configuredFlavor.baseUrl) {
      _environment = Environment.initial;
    } else if (endpoint.contains("mock_")) {
      _environment = Environment.mock;
      endpoint = endpoint.replaceAll("mock_", "");
    } else {
      _environment = Environment.base;
    }
    return endpoint;
  }
}
