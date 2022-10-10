import 'dart:convert';

import 'package:capar/app/data/models/CreatePay/create_pay_model.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/core/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CreatePayRequest {
  final url = createPayUrl;
  Future<CreatePay?> communicationPay(
      enmPaymetnComunication type, Map<String, dynamic> params) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? sessionId = prefs.getString('sessionId');
    final header = {
      "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
      'X-CSRFToken': '$token',
      'Cookie': 'csrftoken=$token; sessionid=$sessionId',
    };

    if (type == enmPaymetnComunication.tmCell) {}
    try {
      final response = await http.post(
          Uri.parse(
            url,
          ),
          body: jsonEncode(params),
          headers: header);

      debugPrint("Request Pay: ${response.body}");
      debugPrint(header.toString());
      debugPrint("Requet Params: $params");
      debugPrint("Status Code Request Pay: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode <= 300) {
        return CreatePay.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
