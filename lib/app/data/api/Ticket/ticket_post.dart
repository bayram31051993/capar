import 'dart:convert';

import 'package:capar/app/data/models/Ticket/get_bus_stations_model.dart';
import 'package:capar/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TicketPost {
  Future<GetBusStationsModel?> getbusstations() async {
    try {
      final response = await http.get(Uri.parse(getBusStantionsUrl));
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
