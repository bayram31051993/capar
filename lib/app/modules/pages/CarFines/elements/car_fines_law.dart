import 'dart:async';

import 'package:capar/core/values/globals.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CarFinesLae extends StatefulWidget {
  const CarFinesLae({Key? key}) : super(key: key);

  @override
  State<CarFinesLae> createState() => _CarFinesLaeState();
}

class _CarFinesLaeState extends State<CarFinesLae> {
  final Completer<WebViewController> controllerWeb =
      Completer<WebViewController>();
  late WebViewController webViewController;
  num position = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(width: 5.w),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                LocaleKeys.law.tr,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: position.toInt(),
          children: [
            WebView(
              initialUrl: uRLJerimeler,
              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webController) {
                webViewController = webController;
                webViewController = webController;
                controllerWeb.complete(webController);
              },
              onPageFinished: (String title) {
                setState(() {
                  position = 0;
                });
              },
              onPageStarted: (String s) async {
                setState(() {
                  position = 1;
                });
              },
            ),
            Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ],
        ));
  }
}
