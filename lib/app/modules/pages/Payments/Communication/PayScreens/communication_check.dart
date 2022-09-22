import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/app/modules/pages/Payments/ServicesPayView/services_pay_view.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunicationCheck extends GetView<ToleglerController> {
  final enmPaymetnComunication type;
  // final Payment? payment;
  final Map<String, dynamic>? parametrs;
  const CommunicationCheck({
    required this.type,
    // this.payment,
    this.parametrs,
  });
  @override
  Widget build(BuildContext context) {
    return ServicesPayView(type);
  }
}
