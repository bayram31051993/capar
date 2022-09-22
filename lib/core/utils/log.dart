import 'dart:developer' as dev show log;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

abstract class Logger {
  static print(String message) {
    FirebaseCrashlytics.instance.log(message);
    dev.log(message);
  }
}
