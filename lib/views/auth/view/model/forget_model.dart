import 'dart:convert';
import 'package:rasid_jack/base/base_model.dart';

class ForgetPasswordModel extends BaseModel<ForgetPasswordModel> {
  final int code;
  final Data? data;

  ForgetPasswordModel({
    required this.code,
    this.data,
  });

  factory ForgetPasswordModel.fromRawJson(String str) =>
      ForgetPasswordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordModel(
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
      };

  @override
  ForgetPasswordModel fromJson(Map<String, dynamic>? json) {
    // TODO: implement fromJson
    return ForgetPasswordModel.fromJson(json!);
  }
}

class Data {
  Data({
    this.message,
  });

  String? message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
