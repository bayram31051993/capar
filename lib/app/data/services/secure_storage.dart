import 'dart:convert';

import 'package:capar/app/data/services/storage_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/utils/enums.dart';

class SecureStorage {
  final _secureStorage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() => IOSOptions(
        accountName: _getAccountName(),
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  String? _getAccountName() {
    // var cabStr = PrvStorage().getStringValue(enmStorageKeys.cabinet);
    // if (cabStr.isEmpty) {
    //   return null;
    // }
    // var cab = Cabinet.fromJson(jsonDecode(cabStr));
    // return cab.phone.isEmpty ? null : cab.phone;
  }

  Future<String> getSecureValue(enmStorageKeys key) async {
    var rez = await _secureStorage.read(
      key: key.name,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
    return rez ?? "";
  }

  void addSecureNewItem(enmStorageKeys key, String value) async {
    await _secureStorage.write(
        key: key.name,
        value: value,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
  }

  void deleteSecure(enmStorageKeys key) async {
    await _secureStorage.delete(
      key: key.name,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  void deleteSecureAll() async {
    await _secureStorage.deleteAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }
}
