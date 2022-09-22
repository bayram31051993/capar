import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/app/modules/pages/Payments/Communal/PayScreen/consumptions.dart';
import 'package:capar/app/modules/pages/Payments/Utilities/utilities.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunalCheck extends GetView<ToleglerController> {
  final enmPaymentCommunal type;
  // final Payment? payment;
  final Map<String, dynamic>? parametrs;

  CommunalCheck({
    required this.type,
    // this.payment,
    this.parametrs,
  });

  @override
  Widget build(BuildContext context) {
    if (type == enmPaymentCommunal.utils) {
      return Utilities();
    }
    if (type == enmPaymentCommunal.water || type == enmPaymentCommunal.electro) {
      return Consumption(type: type);
    }
    // return Scaffold();
    // if (type == enmPaymentType.water || type == enmPaymentType.electro) {
    //   return Consumption(type: type);
    // }
    // return ServicesPayView(type, payment);
    return Scaffold();
  }
}
