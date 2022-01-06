import 'dart:convert';

import 'package:rasid_jack/base/base_model.dart';

class PinCodeModel extends BaseModel<PinCodeModel> {
  final int code;
  final Data? data;

  PinCodeModel({
    required this.code,
    this.data,
  });

  factory PinCodeModel.fromRawJson(String str) =>
      PinCodeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PinCodeModel.fromJson(Map<String, dynamic> json) => PinCodeModel(
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
      };

  @override
  PinCodeModel fromJson(Map<String, dynamic>? json) {
    // TODO: implement fromJson
    return PinCodeModel.fromJson(json!);
  }
}

class Data {
  Data({
    this.token,
  });

  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
