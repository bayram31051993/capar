import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SaveUsersInfo {
  // Save Token
  Future<void> save(token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
  }

  //Save User smsID for register
  Future<void> saveSmsId(smsId) async {
    debugPrint('smsId $smsId');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("sms_id", smsId);
  }

  Future<void> save_password(password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("password", password);
  }

  // Save version
  Future<void> vsersion_num(version) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("version", version);
  }

  // Save version
  Future<void> save_number(number) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("number_capar", number);
  }

  Future<String?> getToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  Future<String?> saveSessionId(sessionID) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("sessionId", sessionID);
  }
}
