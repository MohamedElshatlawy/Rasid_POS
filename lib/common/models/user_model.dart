import 'dart:convert';
import 'package:rasid_jack/base/base_model.dart';

import 'user_data.dart';

class UserModel extends BaseModel<UserModel> {
  final int code;
  final UserData? data;

  UserModel({
    required this.code,
    this.data,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
      };

  @override
  UserModel fromJson(Map<String, dynamic>? json) {
    // TODO: implement fromJson
    return UserModel.fromJson(json!);
  }
}
