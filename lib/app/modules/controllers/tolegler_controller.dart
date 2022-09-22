import 'package:capar/app/data/models/CardsModel/cards_model.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/log.dart';
import '../../../../../core/values/globals.dart';
import '../../../../../core/values/strings.dart';
import '../../../../../generated/locales.g.dart';

class ToleglerController extends GetxController {
  final RxString buttonText = LocaleKeys.cardChoose.tr.obs;
  final RxString arrDate = LocaleKeys.reciveDate.tr.obs;
  final carFineRecivedDay = DateTime.now().obs;
  final codeRequestSending = false.obs;
  final utilsRequestSending = false.obs;
  final errOcurred = false.obs;
  final mobilePayment = false.obs;
  final openCodeField = false.obs;
  final agreeCheck = false.obs;
  final resendCode = false.obs;
  var payMethod = enmPaymentMethod.mobile;
  // PayMobile? payMobile;
  final payementRequesting = false.obs;
  final resendRequired = false.obs;
  final Rx<CreditCard> selectedCard = CreditCard().obs;
  // Step1 step1 = Step1(status: '');
  // Step2? step2;

  final _initController = Get.find<InitializerController>();
  // final _checkMobileProvider = Get.put(CheckMobileProvider());
  // final CheckSMSProvider _checkSMSProvider = Get.put(CheckSMSProvider());
  // final _payMobileProvider = Get.put(PayMobileProvider());
  var _requwstId = "";
  // final SendSMSProvider _sendSMSProvider = Get.put(SendSMSProvider());
  // final _step1provider = Get.put(Step1Provider());
  // final _step2provider = Get.put(Step2Provider());
  // final _step3provider = Get.put(Step3Provider());
  final checkBoxIsUnchecked = false.obs;

  checkAgreement(bool val) {
    agreeCheck(val);
    checkBoxIsUnchecked(val == false);
  }

  // Utils regarding

  final uUtils = 0.0.obs;
  final uElectro = 0.0.obs;
  final uWater = 0.0.obs;
  final uGaz = 0.0.obs;
  final uTotalUtils = 0.0.obs;

  var phoneNumber = TextEditingController();
  // uChangeUtils(double val) {
  //   uUtils(val);
  //   var calc = uUtils.value +
  //       uElectro.value +
  //       uWater.value +
  //       uGaz.value +
  //       _initController.initializer.value.feeCommunal;
  //   uTotalUtils(calc);
  }

  uChangeElectro(double val) {
    // uElectro(val);
    // var calc = uUtils.value +
    //     uElectro.value +
    //     uWater.value +
    //     uGaz.value +
    //     _initController.initializer.value.feeCommunal;
    // uTotalUtils(calc);
  }

  uChangeWater(double val) {
    // uWater(val);
    // var calc = uUtils.value +
    //     uElectro.value +
    //     uWater.value +
    //     uGaz.value +
    //     _initController.initializer.value.feeCommunal;
    // uTotalUtils(calc);
  }

  uChangeGaz(double val) {
    // uGaz(val);
    // var calc = uUtils.value +
    //     uElectro.value +
    //     uWater.value +
    //     uGaz.value +
    //     _initController.initializer.value.feeCommunal;
    // uTotalUtils(calc);
  }

  void chaneCounsumption(enmPaymentType type, String oldVal, String currVal) {
    var old = double.tryParse(oldVal) ?? 0.0;
    var curr = double.tryParse(currVal) ?? 0.0;
    var fee = consumptionFee(type);
    usedConsumption.value = curr - old;
    amountForusedConsumption.value = (usedConsumption.value * fee); //+
        // _initController.initializer.value.feeCommunal;
  }

  // UtilitiesModel utilitiesModel =
  //     UtilitiesModel(id: "", fullname: "", address: "");
  // final _utilsProvider = Get.put(UtilitiesProvider());

  // Future<UtilitiesModel> getUtils() async {
  //   utilsRequestSending(true);
  //   var cabinet = Get.find<HomeController>().cabinet.value;
  //   utilitiesModel = await _utilsProvider.getUtils(cabinet) ?? utilitiesModel;
  //   return utilitiesModel;
  // }

  final usedConsumption = 0.0.obs;
  final amountForusedConsumption = 0.0.obs;
  var timeOfpress = DateTime.now();
  var fisttime = true;

  double consumptionFee(enmPaymentType type) {
    var rez = 1.0;
    // if (type == enmPaymentType.water) {
    //   rez = _initController.initializer.value.feeWater;
    // }
    // if (type == enmPaymentType.electro) {
    //   rez = _initController.initializer.value.feeElectro;
    // }
    return rez;
  }

  void consumptionPayment(enmPaymentType type, Map<String, dynamic> params) {
    // if (!agreeCheck.value) {
    //   checkBoxIsUnchecked(true);
    // } else {
    //   startPayWithBank(type, params);
    // }
  }

  void utilsPayment(Map<String, dynamic> params) {
    // if (!agreeCheck.value) {
    //   checkBoxIsUnchecked(true);
    // } else {
    //   startPayWithBank(enmPaymentType.utils, params);
    // }
  }

  startPayWithMobile(enmPaymentType type, Map<String, dynamic> params) async {
    // payMethod = enmPaymentMethod.mobile;
    // errOcurred(false);
    // mobilePayment(true);
    // codeRequestSending(true);
    // var uriPefix = Strings.uriStep1Prex(type, enmPaymentMethod.mobile);
    // Logger.print("CreditCard is Selected");
    // payMobile = await _payMobileProvider.postPayMobile(
    //     prefix: uriPefix,
    //     data: params,
    //     token: Get.find<HomeController>().cabinet.value.accessToken);
    // if (payMobile == null) {
    //   return onError(false);
    // } else if (payMobile!.message.startsWith('insufficient funds')) {
    //   onError(true,
    //       title: LocaleKeys.insuffAmount.tr,
    //       subtitle: splitPhoneFound(payMobile!.message));
    // } else if (payMobile!.message == 'ready for payment via tmcell') {
    //   codeRequestSending(false);
    //   mobilePayment(false);
    //   openCodeField(true);
    // }
  }

  // Future<Map<String, dynamic>?> startPayWithBank(
  //   return null)
    //   enmPaymentType type, Map<String, dynamic> params) async {
    // errOcurred(false);
    // mobilePayment(false);
    // print(params);
    // payMethod = enmPaymentMethod.halkBank;
    // CreditCard? card = await Get.to(() => AuthTabCards(isChooseMode: true));
    // if (card == null) return null;
    // buttonText(LocaleKeys.getCode.tr);
    // if (card.bind.isNotEmpty) {
    //   Logger.print("CreditCard is Selected With Bank");
    //   // var path = Strings.pathToBankCard(card.bind);
    //   var method = Strings.pathToBankMethod(card.type);
    //   var uriPefix = Strings.uriStep1Prex(type, method);
    //   selectedCard.value = card;
    //   if (method == enmPaymentMethod.halkBank) {
    //     startHack(uriPefix, params);
    //   } else if (method == enmPaymentMethod.senagat ||
    //       method == enmPaymentMethod.millicart) {
    //     startSenagat(uriPefix, params);
    //   } else if (method == enmPaymentMethod.rysgal) {
    //     DialogHandler.dialogMSG(
    //       enmDialogType.info,
    //       subtitle:
    //           "Пока нет возможности оплаты с этой банковской картой.\nBu kartyň görnüşi bilen entäk töleg amala aşyryp bolanok.",
    //       onOkAction: () => Get.back(),
    //     );
    //   }
    //   return {"prifix": uriPefix, "params": params};
    // } else {
    //   return null;
    // }
  // }


  startSenagat(
    String uriPefix,
    Map<String, dynamic> param,
  ) 
  async {
    // codeRequestSending(true);
    // Future.delayed(Duration(seconds: 5)).then(
    //   (value) => codeRequestSending(false),
    // );
    // step1 = await _step1provider.postStep1(uriPefix, param);
    // if (step1.status != "success") {
    //   return onError(false, subtitle: step1.message);
    // } else {
    //   Logger.print('step 1 -passed');
    //   print(step1.url);
    //   try {
    //     Get.to(SenagatBank());
    //     print("Senagat");
    //   } catch (e) {
    //     print(e);
    //   }

      // launch(step1.url);
      // WebView(
      //   initialUrl: step1.url,
      // );
    // }
  }

  startHack(
    String uriPefix,
    Map<String, dynamic> param,
  )
  async {
  //   Logger.print('Start hack');
  //   codeRequestSending(true);
  //   step1 = await _step1provider.postStep1(uriPefix, param);
  //   if (step1.status != "success") {
  //     return onError(false, subtitle: step1.message);
  //   }
  //   Logger.print('step 1 -passed');
  //   final params2 = selectedCard.value.getCardPayParams(step1.orderId);
  //   step2 = await _step2provider.postStep2(params2);
  //   if (step2 == null) {
  //     return onError(false);
  //   }
  //   if (step2!.info != null &&
  //       step2!.info != "Ваш платёж обработан, происходит переадресация...") {
  //     return onError(false, subtitle: step2!.info!.split('<br>').first);
  //   }
  //   Logger.print('step 2 -passed');
  //   _requwstId = await _step3provider.postStep3(step1, step2!) ?? "";
  //   if (_requwstId.isEmpty) {
  //     return onError(false);
  //   }
  //   Logger.print('step 3 -passed');
  //   bool isOk = await _sendSMSProvider.sendSMSConf(_requwstId);
  //   if (isOk) {
  //     Logger.print('Send sms code');
  //     resendRequired(false);
  //     codeRequestSending(false);
  //     openCodeField(true);
  //   } else {
  //     onError(
  //       true,
  //     );
    }
  
  resendCodeHalkBank() async {
    // resendCode(true);
    // bool isOk = await _sendSMSProvider.resendCode(_requwstId);
    // if (isOk) {
    //   Logger.print('Resend sms code');
    //   resendRequired(false);
    //   codeRequestSending(false);
    //   openCodeField(true);
    // } else {
    //   onError(true);
    // }
    // resendCode(false);
  }

  Future<bool> step1Process(String uriPefix, Map<String, dynamic> param) async {
    return true;
    // step1 = await _step1provider.postStep1(uriPefix, param);
    // if (step1.status == "error") {
    //   onError(false, subtitle: step1.message);
    //   return false;
    // } else {
    //   Logger.print('step 1 -passed');
    //   return true;
    // }
  }

  Future<bool> checkSMS(String smsCode) async {
    return true;
    // if (payMethod == enmPaymentMethod.mobile) {
    //   return await checkFinishSMSMobile(smsCode);
    // } else {
    //   return await checkFinishSMSBank(smsCode);
    // }
  }

  Future<bool> checkFinishSMSBank(String code) async {
    return true;
    // payementRequesting(true);
    // var checkSms = await _checkSMSProvider.postCheckSMS(_requwstId, code);
    // if (checkSms == null) {
    //   onError(true);
    //   return false;
    // }
    // if (checkSms.status != "Ok") {
    //   onError(checkSms.status == LocaleKeys.noAttempts.tr,
    //       title: LocaleKeys.error.tr, subtitle: checkSms.status);
    //   return false;
    // }
    // var isOk = await _checkSMSProvider.postFinish(checkSms);
    // if (isOk.status == 'success') {
    //   Logger.print('Payment Success');
    //   Get.back();
    //   onPaySuccess();
    //   Future.delayed(
    //     Duration(seconds: 3),
    //   ).then(
    //     (_) => _initController.loadInitials(),
    //   );
    //   return true;
    // } else if (isOk.status == 'almost') {
    //   Logger.print('Payment almost');
    //   Get.back();
    //   onPaySuccess(subtitle: "Almost");
    //   return true;
    // } else {
    //   onError(
    //     true,
    //     title: isOk.res!.errorMessage == ""
    //         ? LocaleKeys.error.tr
    //         : isOk.res!.errorMessage,
    //     subtitle: isOk.res!.errorCode == "2"
    //         ? "Недостаточно средств на карте"
    //         : isOk.res!.detail,
    //   );
    //   Logger.print('Payment Fail');
    //   payementRequesting(false);
    //   return false;
    // }
  }

  Future<bool> checkFinishSMSMobile(String code) async {
    return true;
    // payementRequesting(true);
    // var token = Get.find<HomeController>().cabinet.value.accessToken;
    // var responce =
    //     await _checkMobileProvider.postChekFinish(code, payMobile!, token);
    // if (responce['status'] == 'success') {
    //   Logger.print('Mobile Payment Success');
    //   Get.back();
    //   onPaySuccess();
    //   Future.delayed(
    //     Duration(seconds: 3),
    //   ).then(
    //     (_) => _initController.loadInitials(),
    //   );
    //   return true;
    // } else {
    //   onError(true);
    //   Logger.print('Mobile Payment Fail');
    //   payementRequesting(false);
    //   return false;
    // }
  }

  String splitPhoneFound(String message) {
    var haveStr = message.split(" ")[2].split("/").first;
    var have = double.tryParse(haveStr) ?? 0.0;
    var needStr = message.split(" ")[2].split("/").last;
    var need = double.tryParse(needStr) ?? 0.0;
    return LocaleKeys.have.tr +
        " " +
        have.toStringAsFixed(2) +
        ", " +
        LocaleKeys.needs.tr +
        " " +
        need.toStringAsFixed(2);
  }

  onError(bool isback, {String? title, String? subtitle, Function()? retry}) {
    // if (isback) {
    //   Get.back();
    // }
    // payementRequesting(false);
    // resendCode(false);
    // errOcurred(true);
    // mobilePayment(false);
    // codeRequestSending(false);
    // selectedCard.value == CreditCard();
    // DialogHandler.dialogMSG(
    //   enmDialogType.error,
    //   title: title,
    //   subtitle: subtitle,
    //   onOkAction: () => Get.back(),
    //   // onCanselAction: retry == null ? null : () => Get.back(),
    //   // canselText: retry == null ? null : "ok",
    //   // okText: LocaleKeys.retry.tr,
    // );
  }

  onPaySuccess({String? subtitle}) {
    // mobilePayment(false);
    // codeRequestSending(false);
    // DialogHandler.dialogMSG(
    //   enmDialogType.ok,
    //   subtitle: subtitle,
    //   onOkAction: () => Get.back(),
    // );
  }

  getPhoneNumber(String phone){
  //   phoneNumber.text = phone;
  // }
}
