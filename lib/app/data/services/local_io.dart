import 'dart:convert';

import 'package:flutter/services.dart';

abstract class LocalIO {
  static Future<dynamic> readJson(String path) async {
    final String response = await rootBundle.loadString(path);
    return jsonDecode(response);
  }

  static Future<void> writeJson(String path, Map data) async {
    final String response = await rootBundle.loadString(path);
    return jsonDecode(response);
  }
}
