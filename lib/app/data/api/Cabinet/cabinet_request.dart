import 'dart:convert';

import 'package:capar/app/data/models/CabinetMOdel/cabinet_model.dart';
import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as d;
import 'package:capar/core/utils/enums.dart';
import 'package:http/http.dart' as http;

class CabinetRequest extends GetConnect {
  // d.Dio dio = d.Dio();
  // Future<CabinetModel?> getCabinet() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // HomeController controller = Get.put(HomeController());
  //   String? token = prefs.getString('token');
  //   String? cookies = prefs.getString('sessionId');
  //   // String? token = PrvStorage().getStringValue(enmStorageKeys.cabinet);

  //   Map<String, String>? header;

  //   header = {"X-CSRFToken": '$token', 'Set-Cookie': '$cookies'};
  //   try {
  //     final response = await dio.get(
  //       who_i_am,
  //       options: d.Options(
  //         headers: header,
  //       ),
  //     );
  //     print('Response who i am ${response.data}');
  //     print('Token cabinet Request: $token');
  //     print('Coockies cabinet Request: $cookies');
  //     debugPrint("SessionID Get: $cookies");
  //     debugPrint("SessionID Get: $header URL:$who_i_am");
  //     if (response.data != null) {
  //       return CabinetModel.fromJson(response.data);
  //     }
  //   } catch (e) {
  //     debugPrint('Error in Cabinet: $e');
  //     return null;
  //   }
  // }

  Future<CabinetModel> getCabinet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // HomeController controller = Get.put(HomeController());
    String? token = prefs.getString('token');
    String? sessionId = prefs.getString('sessionId');
    final header = {
      // 'Content-Type': 'application/json; charset=UTF-8',
      'X-CSRFToken': '$token',
      // 'Set-Cookie': '$sessionId',
      // "Cookie": "mycookie=true"
      'Cookie' : 'csrftoken=$token; $sessionId'
    };
    final response = await http.get(Uri.parse(who_i_am), headers: header
        //  {
        //   'Content-Type': 'application/json; charset=UTF-8',
        //   'X-CSRFToken': '$token',
        //   'Set-Cookie': '$sessionId'
        // },
        );

    debugPrint("Body Cabinet: ${response.body}");
    debugPrint("Token Cabinet Data: $token");
    debugPrint("Code Cabinet: ${response.statusCode}");
    debugPrint("SessionID Get: $sessionId");
    debugPrint(
        "SessionID Get: Header: $header \n  Response: ${response.reasonPhrase}");
    if (response.statusCode == 200 || response.statusCode <= 300) {
      return CabinetModel.fromJson(jsonDecode(response.body));
    }
    //  else if (response.statusCode == 502 || response.statusCode == 400) {
    //   DialogHandler.dialogMSG(enmDialogType.error,
    //       title: LocaleKeys.error.tr,
    //       subtitle: "Bad Request",
    //       onOkAction: () => Get.back());
    //   throw Exception("Error");
    // }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
