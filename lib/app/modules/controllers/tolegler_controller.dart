import 'package:capar/app/data/api/CreatePay/create_pay_request.dart';
import 'package:capar/app/data/models/CardsModel/cards_model.dart';
import 'package:capar/app/data/models/CreatePay/create_pay_model.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/Cabinet/pages/AuthTabCards/auth_tab_cards.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/log.dart';
import '../../../../../core/values/globals.dart';
import '../../../../../core/values/strings.dart';
import '../../../../../generated/locales.g.dart';

class ToleglerController extends GetxController {
  final checkBoxIsUnchecked = false.obs;
  final openCodeField = false.obs;
  final mobilePayment = false.obs;
  final errorCurred = false.obs;
  final codeRequestSending = false.obs;
  final resendCode = false.obs;
  final payementRequesting = false.obs;
  final RxString buttonText = LocaleKeys.cardChoose.tr.obs;
  CreatePayRequest createPayRequest = CreatePayRequest();
  CreatePay? createPayModel;
  final Rx<CreditCard> card = CreditCard().obs;

  Future<Map<String, dynamic>> payCommunication(
      enmPaymetnComunication type, String amount, String phone) async {
    Map<String, dynamic> params = {};
    errorCurred(false);
    mobilePayment(false);
    codeRequestSending(true);
    debugPrint("First params info: ${params.toString()}");
    card.value = await Get.to(() => const AuthTabCards(isChooseMode: true));
    // card.value = selectedValue!;
    debugPrint("${card.value}");
    if (card.value == null) return null!;
    buttonText(LocaleKeys.getCode.tr);
    debugPrint("CArds to send false " + card.toJson().toString());
    params = Strings.getCommunicationParams(type, amount, phone);
    if (params.isNotEmpty) {
      if (card.value.bind.isNotEmpty) {
        debugPrint("CArds to suc $card.toString()");
        debugPrint(params.toString());
        createPayModel = await createPayRequest.communicationPay(type, params);
        codeRequestSending(false);
        if (createPayModel!.detail!.msg == "OK") {
          openCodeField(true);
        }
        if (createPayModel!.detail!.msg ==
                "Wrong Card number {'card_num': '', 'card_owner': '', 'card_expiry': '', 'card_cvc': ''} - None - " ||
            createPayModel!.detail!.type == "error") {
          Get.put(InitializerController()).onError();
          codeRequestSending(false);
        }
      } else {
        codeRequestSending(false);
        debugPrint("CArds to send error $card.toString()");
        return null!;
      }
    }
    return null!;
  }



  
}
