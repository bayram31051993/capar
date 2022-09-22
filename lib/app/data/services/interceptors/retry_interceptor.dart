// import 'dart:io';

// import 'dio_connectivity_request_retrier.dart';
// import '../../../../core/utils/log.dart';
// import 'package:dio/dio.dart';

// class RetryOnConnectionChangeInterceptor extends Interceptor {
//   final DioConnectivityRequestor requestor;
//   int count = 0;
//   RetryOnConnectionChangeInterceptor({required this.requestor});

//   @override
//   Future onError(DioError err, ErrorInterceptorHandler handler) async {
//     count++;
//     Logger.print(" $count * * * * * DioERROR * * * * *  \n - - - - $err");
//     Logger.print("_shouldRetry ${_shouldRetry(err)}");
//     if (_shouldRetry(err)) {
//       try {
//         return requestor.scheduleRequestRetry(err.requestOptions);
//       } catch (e) {
//         return e;
//       }
//     }
//     return err;
//   }

//   bool _shouldRetry(DioError err) {
//     if (count == 2) return false;
//     if (err.error == null || err.error is! SocketException) return false;
//     if (err.type == DioErrorType.connectTimeout ||
//         err.type == DioErrorType.receiveTimeout ||
//         err.type == DioErrorType.response ||
//         err.type == DioErrorType.other ||
//         err.type == DioErrorType.sendTimeout) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
