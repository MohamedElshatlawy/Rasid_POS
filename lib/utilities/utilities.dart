import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:rasid_jack/base/flavor_config.dart';
import 'package:rasid_jack/common/models/user_model.dart';

import 'shared_preferences_keys.dart';
import 'network/api_constants.dart';
import 'shared_preferences_helper.dart';

class Utilities {
  static UserModel? getCurrentUser() =>
      SharedPreferenceHelper.getValueForKey(SharedPrefsKeys.USER_KEY) ??
      UserModel.fromJson(jsonDecode(
          SharedPreferenceHelper.getValueForKey(SharedPrefsKeys.USER_KEY)));

  static setCurrentUser(UserModel user) {
    SharedPreferenceHelper.setValueForKey(SharedPrefsKeys.USER_KEY, user.toRawJson());
  }

  static String getTokenHeader() {
    UserModel? user = getCurrentUser();
    return user == null ? "" : "Bearer ${user.data?.token?.token}";
  }

  static DateTime convertStringToDate(String currentDate) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss", "en");
    return dateFormat.parse(currentDate);
  }

  static int getDayInWeek(String selectedDate) {
    DateTime currentDateTime = convertStringToDate(selectedDate);
    return currentDateTime.weekday;
  }

  static String paymentDateFormat(String currentDate) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.sssssssZ", "en");
    DateTime dateTime = dateFormat.parse(currentDate);

    DateFormat currentFormat = DateFormat("ddMMM, yyyy || HH:mm:ssa", "en");
    return currentFormat.format(dateTime);
  }

  //12Nov, 2020
  static String formatSessionDate(String currentDate) {
    DateFormat dateFormat = DateFormat("ddMMM, yyyy", "en");
    return dateFormat.format(convertStringToDate(currentDate));
  }

  static String fromDateToString(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    return dateFormat.format(dateTime);
  }

  static String reformatDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd", "en");
    return dateFormat.format(dateTime);
  }

  static String reformatSelectedDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy", "en");
    return dateFormat.format(dateTime);
  }

  static bool isValidCity(String cityText, int cityId) {
    if ((cityId == -1 || cityId == 0) && cityText.isNotEmpty) return false;
    return true;
  }

  static bool isValidRegion(String regionText, int regionId) {
    if ((regionId == -1 || regionId == 0) && regionText.isNotEmpty)
      return false;
    return true;
  }

  static List<String> splitPhrase(String phrase) {
    List<String> arr = phrase.split(' ');
    arr.removeWhere((item) => item.trim().isEmpty);
    return arr;
  }

  static DateTime convertTimeToDateTime(String time) {
    DateFormat dateFormat = DateFormat("HH:mm:ss.SSSZ");
    return dateFormat.parse(time);
  }

  static DateTime? convertTimeToFullDate(String time) {
    DateFormat timeFormat = DateFormat("HH:mm:ss.SSSZ", "EN");
    try {
      DateTime parsedDateTime = timeFormat.parse(time);
      DateTime dateTime = DateTime.now();
      DateTime fullTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
          parsedDateTime.hour, parsedDateTime.minute, parsedDateTime.second);
      return fullTime;
    } catch (e) {
      return null;
    }
  }

  static String formatSessionTime(String time) {
    try {
      DateTime dateTime = convertStringToDate(time);
      return formatTime(dateTime);
    } catch (e) {
      return "00:00";
    }
  }

  static String formatTime(DateTime time) {
    DateFormat dateFormat = DateFormat("HH:mma", "en");
    return dateFormat.format(time);
  }

  static String getBaseUrl() {
    return configuredFlavor.baseUrl;
  }

  // static void showToast(BuildContext context, String msg,
  //     {int? duration, int? gravity}) {
  //   Toast.show(msg, context,
  //       duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  // }

  static getMediaBaseUrl() {
    return configuredFlavor.mediaUrl;
  }

  static String reformatTime(String data) {
    try {
      DateFormat dateFormat = DateFormat("HH:mm:ss.SSSZ");
      DateTime dateTime = dateFormat.parse(data);
      return formatTime(dateTime);
    } catch (e) {
      return "00:00";
    }
  }




}
