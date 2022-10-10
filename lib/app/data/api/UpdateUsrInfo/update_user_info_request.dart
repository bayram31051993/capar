import 'dart:convert';

import 'package:capar/app/data/models/UpdateUsrInfoModel/update_usr_info_model.dart';
import 'package:capar/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateUsrInfoRequest {
  Future<UpdateUsrInfoModel?> updateInfo(String? fnm, String? lnm, String? add,
      String crn, String? gid, String? wid, String? eid, String? cid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // HomeController controller = Get.put(HomeController());
    String? token = prefs.getString('token');
    String? sessionId = prefs.getString('sessionId');
    var body = jsonEncode({"crn": crn});
    try {
      final response = await http.post(
        Uri.parse(update_user_info),
        body: body,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
          'X-CSRFToken': '$token',
          'Cookie': 'csrftoken=$token; sessionid=$sessionId',
        },
      );
      print('Usr update: ${response.body}');
      print(response.statusCode);
      debugPrint(body);
      debugPrint("SessionID Get UserUpdate: $sessionId, Token: $token");
      if (response.statusCode == 200 || response.statusCode < 300) {
        return UpdateUsrInfoModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
