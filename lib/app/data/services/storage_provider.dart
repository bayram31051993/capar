import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/utils/enums.dart';

class PrvStorage {
  final _getStorage = GetStorage();

  void logOUT() {
    _getStorage.erase();
  }

  String getStringValue(enmStorageKeys key) {
    return _getStorage.read(key.name) ?? '';
  }

  bool getBoolValue(enmStorageKeys key) {
    return _getStorage.read(key.name) ?? false;
  }

  saveValue(enmStorageKeys key, dynamic value) {
    if (value.runtimeType == String && value.toString().isEmpty ||
        value.toString() == " ") {
    } else {
      _getStorage.write(key.name, value);
    }
  }

  delValue(enmStorageKeys key) {
    _getStorage.remove(key.name);
  }

  String getLocal() {
    return _getStorage.read(enmStorageKeys.local.name) ?? 'ru_RU';
  }

  ThemeMode getThemeMode() {
    return isSavedDarkmode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkmode() {
    return _getStorage.read(enmStorageKeys.isDarkMode.name) ?? false;
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkmode() ? ThemeMode.light : ThemeMode.dark);
    saveValue(enmStorageKeys.isDarkMode, !isSavedDarkmode());
  }

  List<String> getListValues(enmStorageKeys key) {
    _getStorage.writeIfNull(key.name, []);
    final List<dynamic> list = _getStorage.read(key.name);
    List<String> data = [];
    for (var el in list) {
      data.add(el.toString());
    }
    return data;
  }

  addToList(enmStorageKeys key, String value) {
    debugPrint('addToList $enmStorageKeys, $key, $value');
    if (value.isEmpty || value == " " || value == "-") return;
    _getStorage.writeIfNull(key.name, []);
    var cur = getListValues(key);
    if (!cur.contains(value)) {
      cur.add(value.trim());
      saveValue(key, cur);
    }
  }

  void delFromList(enmStorageKeys key, String valueToBeDel) {
    var cur = getListValues(key);
    if (cur.contains(valueToBeDel)) {
      cur.remove(valueToBeDel);
      saveValue(key, cur);
    }
  }
}
