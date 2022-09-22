// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';

// import '../../../../core/utils/log.dart';

// class DioConnectivityRequestor {
//   final Dio dio;
//   final Connectivity connectivity;
//   DioConnectivityRequestor({required this.dio, required this.connectivity});
//   Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
//     StreamSubscription? streamSubscription;
//     final responseCompleter = Completer<Response>();
//     streamSubscription = connectivity.onConnectivityChanged.listen(
//       (event) {
//         if (event != ConnectivityResult.none) {
//           Logger.print(" - - - - \n -------- ****** \n RECONNECT");
//            streamSubscription!.cancel();
//           responseCompleter.complete(
//             dio.request(
//               requestOptions.path,
//               cancelToken: requestOptions.cancelToken,
//               data: requestOptions.data,
//               onReceiveProgress: requestOptions.onReceiveProgress,
//               onSendProgress: requestOptions.onSendProgress,
//               queryParameters: requestOptions.queryParameters,
//               options: Options(
//                 method: requestOptions.method,
//                 sendTimeout: requestOptions.sendTimeout,
//                 contentType: requestOptions.contentType,
//                 extra: requestOptions.extra,
//                 followRedirects: requestOptions.followRedirects,
//                 headers: requestOptions.headers,
//                 listFormat: requestOptions.listFormat,
//                 maxRedirects: requestOptions.maxRedirects,
//                 receiveDataWhenStatusError:
//                     requestOptions.receiveDataWhenStatusError,
//                 receiveTimeout: requestOptions.receiveTimeout,
//                 requestEncoder: requestOptions.requestEncoder,
//                 responseDecoder: requestOptions.responseDecoder,
//                 responseType: requestOptions.responseType,
//                 validateStatus: requestOptions.validateStatus,
//               ),
//             ),
//           );
//         }
//       },
//     );
//     return responseCompleter.future;
//   }
// }
