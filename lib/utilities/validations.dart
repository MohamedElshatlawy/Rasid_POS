import 'package:rasid_jack/utilities/localization/localizations.dart';
import 'package:validators/validators.dart' as validator;

import 'localization/localizations.dart';

mixin Validations {
  isHasArabicChar(String value) {
    if (value.isNotEmpty)
      return !RegExp(r"^[a-zA-Z-0-9-.-_.@.\s\']*$").hasMatch(value);
    return false;
  }

  /// Password strategy min 8 digits
  /// min 1 numeric
  /// min 1 lowercase character
  /// min 1 uppercase character
  /// min 1 special character
  bool validatePassword(String password) => RegExp(
        r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])([a-zA-Z0-9@$!%*?&]{8,})$",
        multiLine: false,
      ).hasMatch(password);

  String? validateEmail(String value) {
    if (validator.isNull(value) || !validator.isEmail(value))
      return '${AppLocalizations().pleaseEnter} ${AppLocalizations().email} ${AppLocalizations().correctly}';
  }

  String? validateIdentity(String value) {
    if (validator.isNull(value) || value.length < 10)
      return '${AppLocalizations().pleaseEnter} ${AppLocalizations().identity} ${AppLocalizations().correctly}';
  }

  String? validateRegistrationNumber(String value) {
    if (validator.isNull(value) || value.length < 10)
      return '${AppLocalizations().pleaseEnter} ${AppLocalizations().registrationNumber} ${AppLocalizations().correctly}';
  }

  String? validatePhoneNumber(String value) {
    if (validator.isNull(value) || !validator.isLength(value, 8, 14))
      return '${AppLocalizations().pleaseEnter} ${AppLocalizations().phoneNumber} ${AppLocalizations().correctly}';
  }
}
