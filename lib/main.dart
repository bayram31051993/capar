import 'package:capar/app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

Future init() async {
  await GetStorage.init();
}
