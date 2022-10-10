import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:capar/app/data/models/Ticket/get_bus_stations_model.dart';
import 'package:capar/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TicketPost {
  Future<GetBusStationsModel?> getbusstations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? sessionId = prefs.getString('sessionId');
    try {
      final response = await http.get(
        Uri.parse(getBusStantionsUrl),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
          'X-CSRFToken': '$token',
          'Cookie': 'csrftoken=$token; sessionid=$sessionId',
        },
      );
      print("Bus Ticket body: " + response.body);
      if (response.statusCode == 200 || response.statusCode < 300) {
        return GetBusStationsModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
