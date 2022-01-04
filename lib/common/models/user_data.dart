class UserData {
  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.serialNumber,
    this.serialCode,
    this.identificationNumber,
    this.company,
    this.branch,
    this.createdAt,
    this.token,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? serialNumber;
  String? serialCode;
  String? identificationNumber;
  Company? company;
  Branch? branch;
  DateTime? createdAt;
  String? token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        serialNumber: json["serial_number"],
        serialCode: json["serial_code"],
        identificationNumber: json["identification_number"],
        company: Company.fromJson(json["company"]),
        branch: Branch.fromJson(json["branch"]),
        createdAt: DateTime.parse(json["created_at"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "serial_number": serialNumber,
        "serial_code": serialCode,
        "identification_number": identificationNumber,
        "company": company!.toJson(),
        "branch": branch!.toJson(),
        "created_at": createdAt!.toIso8601String(),
        "token": token,
      };
}

class Branch {
  Branch({
    this.id,
    this.name,
    this.companyId,
    this.managerId,
    this.cityId,
    this.deactivatedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? companyId;
  int? managerId;
  int? cityId;
  dynamic? deactivatedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        companyId: json["company_id"],
        managerId: json["manager_id"],
        cityId: json["city_id"],
        deactivatedAt: json["deactivated_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "company_id": companyId,
        "manager_id": managerId,
        "city_id": cityId,
        "deactivated_at": deactivatedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Company {
  Company({
    this.id,
    this.ownerId,
    this.financeManagerId,
    this.name,
    this.taxNumber,
    this.commercialRegister,
    this.deactivatedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? ownerId;
  int? financeManagerId;
  String? name;
  String? taxNumber;
  String? commercialRegister;
  dynamic? deactivatedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        ownerId: json["owner_id"],
        financeManagerId: json["finance_manager_id"],
        name: json["name"],
        taxNumber: json["tax_number"],
        commercialRegister: json["commercial_register"],
        deactivatedAt: json["deactivated_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner_id": ownerId,
        "finance_manager_id": financeManagerId,
        "name": name,
        "tax_number": taxNumber,
        "commercial_register": commercialRegister,
        "deactivated_at": deactivatedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
