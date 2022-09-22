import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/app/modules/pages/Payments/Media/PayScreens/service_media_pay.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaCheck extends GetView<ToleglerController> {
  final enmPaymentMedia type;
  // final Payment? payment;
  final Map<String, dynamic>? parametrs;
  const MediaCheck({
    required this.type,
    // this.payment,
    this.parametrs,
  });
  @override
  Widget build(BuildContext context) {
    return ServiceMediaOay(type);
  }
}
