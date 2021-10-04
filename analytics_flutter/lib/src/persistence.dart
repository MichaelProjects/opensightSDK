import 'dart:convert';

import 'package:analytics_flutter/src/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PresistencesLayer {
  final String storeKey = "io.opensight/";

  Future<bool> isNewUser() async {
    /// check if an exists for the given key below.
    /// if so it returns the needed value.
    bool isNew = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var result = pref.getBool(storeKey + "isNewUser");
    if (result != null) {
      isNew = result;
    }
    return isNew;
  }

  Future<void> storeUserState(bool isNew) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(storeKey + "isNewUser", isNew);
  }

  Future<void> storeSession(Session session) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String encodedData = session.toJson().toString();
    pref.setString(storeKey + "sessionData", encodedData);
  }

  Future<String?> loadSessions() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? data = pref.getString(storeKey + "sessionData");
    return data;
  }

  Future<void> removeSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(storeKey + "sessionData");
  }
}
