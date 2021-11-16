
import 'package:rasid_jack/base/base_model.dart';

class SuccessModel extends BaseModel<SuccessModel>{
  int? code;
  SuccessData? data;

  SuccessModel({this.code, this.data});

  SuccessModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null? new SuccessData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }

  @override
  SuccessModel fromJson(Map<String, dynamic>? json) {
    return SuccessModel.fromJson(json!);
  }
}

class SuccessData {
  String? message;

  SuccessData({this.message});

  SuccessData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}