// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:capar/app/data/models/ConfirmSmsModel/confirm_sms_model.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/enums.dart';

class ConfirmSms {
  Future<ConfirmSmsModel> confirmSms(code, pwd) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String smsId = preferences.getInt("sms_id").toString();

    debugPrint('smsId $smsId');

    final response = await http.post(
      Uri.parse(confirm_sms),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'sms_id': smsId,
          'code': code,
          "pwd": pwd,
        },
      ),
    );

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode <= 300) {
      return ConfirmSmsModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      DialogHandler.dialogMSG(enmDialogType.error,
          title: LocaleKeys.error.tr,
          subtitle: LocaleKeys.moreAttempts.tr,
          onOkAction: () => Get.back());
      throw Exception('Wrong SMS Code.');
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
