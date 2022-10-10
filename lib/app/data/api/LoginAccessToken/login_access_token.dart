import 'dart:convert';
import 'package:capar/app/data/models/LoginAccessTokenModel/login_access_token_model.dart';
import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/utils/save_user_info.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/enums.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginAccessTokenPost {
  // SaveUsersInfo saveUsersInfo = SaveUsersInfo();
  Map<String, String> headers = {};
  Future<LoginAccessTokenModel?> login_access_token(number, password) async {
    try {
      final response = await http.post(
        Uri.parse(login_acces_toke_url),
        body: {"username": number, "password": password},
        headers: {
          "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        },
      );
      updateCookie(response);
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      debugPrint(headers.toString());
      if (response.statusCode == 200 || response.statusCode < 300) {
        return LoginAccessTokenModel.fromJson(jsonDecode(response.body));
        // } else if (response.statusCode == 422 || response.statusCode == 404) {
        //   DialogHandler.dialogMSG(enmDialogType.error,
        //       title: LocaleKeys.error.tr,
        //       subtitle: LocaleKeys.chUser.tr,
        //       onOkAction: () => Get.back());

        //   throw Exception("Error");
        // }
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      print(e);
    }
  }

  void updateCookie(http.Response response) async {
    final prefs = await SharedPreferences.getInstance();
    String? rawCookie = response.headers['set-cookie'];
    String sessionIdText = '';
    if (rawCookie != null) {
      int index = rawCookie.indexOf('sessionid');
      debugPrint(index.toString());
      headers['sessionid'] =
          (index == 0) ? rawCookie : rawCookie.substring(index+10, index+42);
      headers.values.forEach((element) {
        sessionIdText = element;
      });
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("sessionId", sessionIdText);
      debugPrint(rawCookie);
      debugPrint(headers.toString());
    }
  }
}
