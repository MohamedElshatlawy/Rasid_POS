import 'package:rasid_jack/base/base_model.dart';

class ErrorModel extends BaseModel<ErrorModel> {
  int? code;
  List<String>? error;

  ErrorModel({
    this.code,
    this.error,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        code: json["code"],
        error: List<String>.from(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "error": List<dynamic>.from(error!),
      };

  @override
  ErrorModel fromJson(Map<String, dynamic>? json) {
    // TODO: implement fromJson
    return ErrorModel.fromJson(json!);
  }

  @override
  String toString() {
    return 'Error code: $code, error: $error}';
  }
}
