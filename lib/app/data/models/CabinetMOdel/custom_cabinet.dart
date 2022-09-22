import 'dart:convert';

import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/core/utils/enums.dart';

class CustomCabinet {
  String id = "";
  String accessToken = PrvStorage().getStringValue(enmStorageKeys.token);

  CustomCabinet({
    required this.id,
    required this.accessToken,
  });

  CustomCabinet.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    accessToken = json['accessToken'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['accessToken'] = accessToken;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
