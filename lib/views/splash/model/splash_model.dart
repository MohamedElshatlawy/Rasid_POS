
import 'package:rasid_jack/base/base_model.dart';

import 'splash_data.dart';

class SplashModel extends BaseModel<SplashModel> {

  final int? code;
  final List<Speciality?>? specialities;

  SplashModel({
    this.code,
    this.specialities,
  });

  factory SplashModel.fromJson(Map<String, dynamic> json) =>
      SplashModel(
        code: json["code"],
        specialities: List<Speciality>.from(
            json["data"].map((x) => Speciality.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "code": code,
        "data": List<dynamic>.from(specialities!.map((x) => x?.toJson())),
      };

  @override
  SplashModel fromJson(Map<String, dynamic>? json) {
    return SplashModel.fromJson(json!);
  }
}

class Speciality {
  final String? specialityId;
  final String? specialityName;

  Speciality({
    this.specialityId,
    this.specialityName,
  });

  factory Speciality.fromJson(Map<String, dynamic> json) =>
      Speciality(
        specialityId: json["code"],
        specialityName: json["specialistName"],
      );

  Map<String, dynamic> toJson() =>
      {
        "code": specialityId,
        "specialistName": specialityName,
      };

  @override
  String toString() {
    return specialityName!;
  }
}
