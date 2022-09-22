import '../../../core/utils/log.dart';

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    Logger.print(message);
    return '----- ' + message;
  }
}
