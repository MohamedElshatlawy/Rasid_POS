import 'dart:convert';

class UserData {
  bool isVerfiy;
  final String? accountType;
  final Token? token;
  final String? userName;
  String? firstName;
  String? lastName;
  final String? email;
  final bool? isMale;
  final int? cityId;
  final String? phoneNumber;
  final int? teacherStatus;
  final String? userId;
  final String? studentLevelId;
  final String? imei;
  String? profileImage;
  String? address;
  bool? hasCompleteData = false;

  UserData({
    required this.isVerfiy,
    this.accountType,
    this.token,
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.isMale,
    this.cityId,
    this.phoneNumber,
    this.teacherStatus,
    this.userId,
    this.studentLevelId,
    this.imei,
    this.profileImage,
    this.address,
    this.hasCompleteData,
  });

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  String get fullName => '$firstName $lastName';

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        isVerfiy: json["isVerfiy"],
        accountType: json["accountType"],
        token: Token.fromJson(json["token"]),
        userName: json["userName"],
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        email: json["email"] == null ? "" : json["email"],
        isMale: json["isMale"],
        cityId: json["cityId"],
        phoneNumber: json["phoneNumber"],
        teacherStatus: json['teacherStatus'],
        userId: json['userId'],
        studentLevelId: json["studentLevelId"],
        imei: json["imei"],
        profileImage: json["profileImage"],
        address: json["address"],
        hasCompleteData: json["hasCompleteData"],
      );

  Map<String, dynamic> toJson() => {
        "isVerfiy": isVerfiy,
        "accountType": accountType,
        "token": token?.toJson(),
        "userName": userName,
        "firstName": firstName,
        'lastName': lastName,
        "email": email,
        "isMale": isMale,
        "cityId": cityId,
        "phoneNumber": phoneNumber,
        "teacherStatus": teacherStatus,
        "userId": userId,
        "studentLevelId": studentLevelId,
        "imei": imei,
        "profileImage": profileImage,
        "address": address,
        "hasCompleteData": hasCompleteData,
      };

// String getAvatar() {
//   return "${Utilities.getMediaBaseUrl()}$profileImage";
// }

  // Define that two persons are equal if their SSNs are equal
  bool operator ==(dynamic other) =>
      other != null && other is UserData && this.userId == other.userId;

  @override
  int get hashCode => super.hashCode;

}

class Token {
  final String? token;
  final String? refreshToken;

  Token({
    this.token,
    this.refreshToken,
  });

  factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
      };
}
