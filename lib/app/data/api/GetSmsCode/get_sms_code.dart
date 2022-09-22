import 'dart:convert';

import 'package:capar/app/data/models/GetSmsCodeModel/get_sms_code_model.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/core/values/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetUserSmsCode {
  Future<GetUserSmsCodeModel> loginAccessToke(phone) async {
    final http.Response response = await http.post(
      Uri.parse(getUserSmsCode),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"phone": phone, "message": "Welcome to Capar"}),
    );

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode <= 300) {
      return GetUserSmsCodeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load SMS');
    }
  }
}
