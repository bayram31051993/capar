import 'package:auto_size_text/auto_size_text.dart';
import 'package:capar/app/data/api/CreatePay/create_pay_request.dart';
import 'package:capar/app/data/models/PaymentsModel/payments_model.dart';
import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/app/modules/pages/Payments/CheckOutScreen/check_out_app_bar.dart';
import 'package:capar/app/modules/pages/Payments/Communication/PayScreens/communication_check_app_bar.dart';
import 'package:capar/app/modules/pages/Payments/finish_pay_contetnt.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/utils/suggestor.dart';
import 'package:capar/core/values/strings.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class ServicesPayView extends GetView<ToleglerController> {
  final enmPaymetnComunication type;
  // final enmPaymetnComunication comType;
  // final Payment? payment;
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final createPayRequest = CreatePayRequest();
  ServicesPayView(this.type);

  enmTextFielType fielType(enmPaymetnComunication type) {
    if (type == enmPaymetnComunication.tmCell) {
      return enmTextFielType.user_register;
    } else {
      if (type == enmPaymetnComunication.tmTelekom) {
        return enmTextFielType.homePhoneField;
      } else {
        return enmTextFielType.agtsPhoneField;
      }
    }
  }

  payProces(enmPaymetnComunication type) {
    if (!_keyForm.currentState!.validate()) return;
    // var params = Strings.getCommunicationParams(
    //     type, _amountController.text, _phone.text);
    controller.payCommunication(type, _amountController.text, _phone.text);
    // final Telephony telephony = Telephony.instance;
    // telephony.listenIncomingSms(
    //     onNewMessage: (SmsMessage message) {
    //       //print(message.body); //Your one-time password for purchase authorization is: 85309
    //       if (message.body!.startsWith('Your one-time')) {
    //         _codeController.text = message.body!.split(':')[1].trim();
    //       }
    //     },
    //     listenInBackground: false);
  }

  saveIfSucces() {
    if (type.name.startsWith("agts")) {
      Suggestor.writeToMemory(enmStorageKeys.agtshomePhones, _phone.text);
    }
    if (type == enmPaymetnComunication.tmCell) {
      Suggestor.writeToMemory(enmStorageKeys.phonesCell, _phone.text);
    }
    if (type == enmPaymetnComunication.tmTelekom) {
      Suggestor.writeToMemory(enmStorageKeys.homePhonesOther, _phone.text);
    }
    // if (type == enmPaymetnComunication.cabelTV) {
    //   Suggestor.writeToMemory(enmStorageKeys.cabelTV, _phone.text);
    // }
  }

  @override
  Widget build(BuildContext context) {
    // if (payment != null) {
    //   _phone.text =
    //       Strings.formatPhoneToRaw(payment!.paidNumber, payment!.paymentType);
    //   _amountController.text = payment!.amount.toString();
    // }
    //Contacts

    return Scaffold(
      body: Obx(
        () {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: controller.openCodeField.value
                ? SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppBar(
                          automaticallyImplyLeading: false,
                          titleSpacing: 20.w,
                          backgroundColor: Colors.transparent,
                          title: Row(
                            children: [
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: AutoSizeText(
                                  LocaleKeys.confirTheCode.tr,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 18.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        PayFinishContent(
                          saverIfSuccess: saveIfSucces,
                          forWhat: _phone.text,
                          howMuch: _amountController.text,
                        )
                      ],
                    ),
                  )
                : Form(
                    key: _keyForm,
                    child: Column(
                      children: [
                        CommunicationCheckAppBar(type: type),
                        SizedBox(height: 20.h),
                        Spaces.horizontal(
                          UIElements.customTextField(
                            type: fielType(type),
                            textController: _phone,
                            enabled: !controller.openCodeField.value,
                            // autoFocux: true,
                          ),
                        ),
                        Spaces.horizontal(
                          UIElements.simpleTextField(
                            type: enmTextFielType.amonutField,
                            textController: _amountController,
                            enabled: !controller.openCodeField.value,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Spaces.horizontal(
                          SizedBox(
                            height: 50.h,
                            width: controller.codeRequestSending.value
                                ? 50.w
                                : double.infinity,
                            child: FloatingActionButton.extended(
                              heroTag: UniqueKey().toString(),
                              onPressed: () async {
                                if (controller.codeRequestSending.value) return;
                                payProces(type);
                              },
                              label: controller.codeRequestSending.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Text(
                                      controller.buttonText.value,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade200),
                                    ),
                            ),
                          ),
                        ),
                        // if (!controller.codeRequestSending.value)
                        //   Expanded(
                        //     child: Padding(
                        //       padding: EdgeInsets.only(top: 20.h),
                        //       child: PaymentsHistory(
                        //           type: type,
                        //           phone: controller.phoneNumber,
                        //           amountController: _amountController),
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
