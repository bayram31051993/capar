import 'dart:convert';

import 'package:capar/app/data/models/GetAllRadarFinesModel/get_all_radar_view_model.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAllFinesPost {
  HomeController carNUmber = Get.put(HomeController());

  Future<GetAllPygg?> getAllPyggpost(carNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await http.post(Uri.parse(getAllFines + carNumber),
          headers: {"X-CSRFToken": "$token"});
      debugPrint("Get fines code: " + response.statusCode.toString());
      debugPrint("Get fines body: " + response.body);
      if (response.statusCode == 200 || response.statusCode < 300) {
        return GetAllPygg.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
