
import 'package:rasid_jack/base/user_types/commercial.dart';
import 'package:rasid_jack/base/user_types/famous.dart';
import 'package:rasid_jack/base/user_types/free.dart';

import 'base_user_type.dart';

class UserStrategyType {
  BaseUserType? baseUserType;
  Map<String, BaseUserType> typeMap = new Map();

  UserStrategyType() {
    _fillTypeMap();
  }

  _fillTypeMap() {

    typeMap["commercial"] = new Commercial();
    typeMap["famous"] = new Famous();
    typeMap["free"] = new Free();
  }

  BaseUserType? getUserType(String userType) {
    return typeMap['userType.toLowerCase()'];
  }
}
