import 'package:capar/app/data/models/PaymentsModel/payments_model.dart';
import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/app/modules/pages/CarFines/elements/pay_fines.dart';
import 'package:capar/app/modules/pages/Payments/Communal/communal_screen.dart';
import 'package:capar/app/modules/pages/Payments/Communication/communication_scree.dart';
import 'package:capar/app/modules/pages/Payments/Media/media_screen.dart';
import 'package:capar/app/modules/pages/Payments/ServicesPayView/services_pay_view.dart';
import 'package:capar/app/modules/pages/Payments/Suw_TuT/suw_tut_screen.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/ticket_screen.dart';
import 'package:capar/app/modules/pages/Payments/Utilities/utilities.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends GetView<ToleglerController> {
  final enmPaymentType type;
  // final Payment? payment;
  final Map<String, dynamic>? parametrs;

  CheckOutScreen({
    required this.type,
    // this.payment,
    this.parametrs,
  });

  @override
  Widget build(BuildContext context) {
    if (type == enmPaymentType.pygg) {
      return CarFinesPay();
    }
    if (type == enmPaymentType.ticket) {
      return TicketScreen(type: type);
    }
    if (type == enmPaymentType.suw_tut) {
      return SuwTutScreen();
    }

    if (type == enmPaymentType.media) {
      return MediaScreen(type);
    }
    if (type == enmPaymentType.communcation) {
      return CommunicationScreen(type);
    }
    if (type == enmPaymentType.conmmunal) {
      return CommunalScreen(type);
    }
    // if (type == enmPaymentType.utils) {
    //   return Utilities();
    // }
    // return Scaffold();
    // if (type == enmPaymentType.water || type == enmPaymentType.electro) {
    //   return Consumption(type: type);
    // }
    // return ServicesPayView(type, payment);
    return Scaffold();
  }
}
