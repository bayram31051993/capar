// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:convert';
import 'package:capar/app/data/models/InitModel/init_model.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:capar/core/utils/enums.dart';

class InitProvider extends GetConnect {
  // InitializerController controller = Get.put(InitializerController());
  Future<InitModel> getInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // HomeController controller = Get.put(HomeController());
    String? token = prefs.getString('token');
    String? sessionId = prefs.getString('sessionId');
    final response = await http.get(
      Uri.parse(getInitUrl),
      headers: {
        'Cookie' : 'csrftoken=$token; $sessionId'
      },
    );

    debugPrint("Body: ${response.body}");
    debugPrint("Token Init Data: $token");
    debugPrint("Code Init: ${response.statusCode}");
    debugPrint("SessionID Get Init: $sessionId");
    if (response.statusCode == 200 || response.statusCode <= 300) {
      return InitModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 502) {
      DialogHandler.dialogMSG(enmDialogType.error,
          title: LocaleKeys.error.tr,
          subtitle: LocaleKeys.chUser.tr,
          onOkAction: () => Get.back());
      throw Exception("Error");
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
