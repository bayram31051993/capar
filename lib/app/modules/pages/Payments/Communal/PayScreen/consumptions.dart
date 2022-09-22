import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/app/modules/pages/Payments/CheckOutScreen/check_out_app_bar.dart';
import 'package:capar/app/modules/pages/Payments/Communal/PayScreen/communal_chak_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/apperience/ui_elements.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/utils/suggestor.dart';
import '../../../../../../core/values/styles.dart';
import '../../../../../../generated/locales.g.dart';

class Consumption extends GetView<ToleglerController> {
  final enmPaymentCommunal type;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _keyCode = GlobalKey<FormFieldState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _abounentNum = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _consumptionOld = TextEditingController();
  final TextEditingController _consumptionCurrent = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final InitializerController initController = Get.put(InitializerController());
  final ToleglerController controller = Get.put(ToleglerController());
  Consumption({Key? key, required this.type}) : super(key: key);

  double get consumptionDelta {
    var oldVal = double.tryParse(_consumptionOld.text) ?? 0.0;
    var current = double.tryParse(_consumptionCurrent.text) ?? 0.0;
    return current - oldVal;
  }

  Map<String, dynamic> get params {
    return {
      "nam": "${_surname.text.trim()} ${_name.text.trim()}",
      "add": _address.text,
      "aid": _abounentNum.text.split(" ").last,
      // "amount": controller.amountForusedConsumption.toStringAsFixed(2),
      "paytype": type.name,
    };
  }

  saveIfSucces() {
    Suggestor.writeToMemory(enmStorageKeys.names, _name.text);
    Suggestor.writeToMemory(enmStorageKeys.surnames, _surname.text);
    Suggestor.writeToMemory(enmStorageKeys.abonentNum, _abounentNum.text);
  }

  checkAdnFinish() {
    if (!_keyCode.currentState!.validate()) return;
    // controller.checkSMS(_codeController.text);
  }

  onEditionCurrent(String val) {
    // controller.chaneCounsumption(type, _consumptionOld.text, val);
  }

  onEditionOld(String oldVal) {
    var old = double.tryParse(oldVal) ?? 0.0;
    var newVal = double.tryParse(_consumptionCurrent.text) ?? 0.0;
    if (newVal > old) {
      onEditionCurrent(_consumptionCurrent.text);
    }
  }

  requestSMS() {
    if (!_keyForm.currentState!.validate()) return;
    // if (!controller.agreeCheck.value) {}

    // controller.consumptionPayment(type, params);
    //listenForSMS();
  }

  @override
  Widget build(BuildContext context) {
    final metrics =
        type == enmPaymentCommunal.water ? LocaleKeys.m3.tr : LocaleKeys.kwt.tr;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child:
                // Obx(
                //   () =>
                AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: controller.openCodeField.value
                  ? controller.mobilePayment.value
                      ? SizedBox(
                          height: Get.height,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 150.h),
                          child: Container()
                          // PayFinishContent(
                          //   saverIfSuccess: saveIfSucces,
                          //   howMuch: controller.amountForusedConsumption
                          //       .toStringAsFixed(2),
                          //   forWhat: _abounentNum.text,
                          // ),
                          )
                  : Form(
                      key: _keyForm,
                      child: Column(
                        children: [
                          SizedBox(height: 150.h),
                          Spaces.horizontal(
                            UIElements.customTextField(
                              type: enmTextFielType.surnameField,
                              textController: _surname,
                              lableText: LocaleKeys.name.tr +
                                  " " +
                                  LocaleKeys.surname.tr,
                            ),
                          ),
                          Spaces.horizontal(
                            UIElements.customTextField(
                              type: enmTextFielType.abonetTelefon,
                              textController: _abounentNum,
                            ),
                          ),
                          Spaces.horizontal(
                            UIElements.customTextField(
                              type: enmTextFielType.adressFiel,
                              textController: _address,
                            ),
                          ),
                          if (type == enmPaymentCommunal.water)
                            Spaces.horizontal(
                              UIElements.customTextField(
                                  type: enmTextFielType.waterM3,
                                  textController: _consumptionOld,
                                  lableText:
                                      "${LocaleKeys.oldIndicators.tr} ${LocaleKeys.m3.tr}",
                                  onChanging: onEditionOld),
                            ),
                          if (type == enmPaymentCommunal.electro)
                            Spaces.horizontal(
                              UIElements.customTextField(
                                  type: enmTextFielType.energykWt,
                                  textController: _consumptionOld,
                                  lableText:
                                      "${LocaleKeys.oldIndicators.tr} ${LocaleKeys.kwt.tr}",
                                  onChanging: onEditionOld),
                            ),
                          if (type == enmPaymentCommunal.water)
                            Spaces.horizontal(
                              UIElements.customTextField(
                                  type: enmTextFielType.waterM3,
                                  textController: _consumptionCurrent,
                                  lableText:
                                      "${LocaleKeys.currentIndicators.tr} ${LocaleKeys.m3.tr}",
                                  onChanging: onEditionCurrent),
                            ),
                          if (type == enmPaymentCommunal.electro)
                            Spaces.horizontal(
                              UIElements.customTextField(
                                  type: enmTextFielType.energykWt,
                                  textController: _consumptionCurrent,
                                  lableText:
                                      "${LocaleKeys.currentIndicators.tr} ${LocaleKeys.kwt.tr}",
                                  onChanging: onEditionCurrent),
                            ),
                          Spaces.horizontal(
                            CheckboxListTile(
                              side: BorderSide(
                                  color: controller.checkBoxIsUnchecked.value
                                      ? Theme.of(context).errorColor
                                      : Colors.grey,
                                  width:
                                      // controller.checkBoxIsUnchecked.value
                                      //     ?
                                      8
                                  // : 2,
                                  ),
                              title: Text("${LocaleKeys.agreeForFee.tr}",
                                  // '${LocaleKeys.agreeForFee.tr} ${initController
                                  //         .initializer.value.feeCommunal} ${LocaleKeys.manat.tr}',
                                  style: TextStyle(fontSize: 14.sp)),
                              // value: controller.agreeCheck.value,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (val) {}, value: true,
                              // controller.agreeCheck.value = val ?? false,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Spaces.horizontal(
                            SizedBox(
                              height: 50.h,
                              width: double.infinity,
                              child: 
                              // Obx(
                              //   () => 
                                SizedBox(
                                  height: 50.h,
                                  width:
                                      // controller.codeRequestSending.value
                                      //     ? 50.w
                                      //     :
                                      double.infinity,
                                  child: FloatingActionButton.extended(
                                    heroTag: UniqueKey().toString(),
                                    onPressed: () {
                                      // if (controller.codeRequestSending.value ||
                                      //     controller.usedConsumption.value < 0) {
                                      //   return;
                                      // }
                                      requestSMS();
                                    },
                                    label: Text(
                                      LocaleKeys.pay.tr +
                                          " " +
                                          // controller.amountForusedConsumption
                                          //     .toStringAsFixed(2) +
                                          // " " +
                                          LocaleKeys.manat.tr,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: Colors.grey.shade200,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          // ),
                        ],
                      ),
                    ),
            ),
            // ),
          ),
          CommunalCheckAppBar(
              type: type,
              table:
                  // Obx(
                  //   () {
                  // if (controller.usedConsumption.value < 0) {
                  //   return Spaces.horizontal(
                  //     Text(
                  //       LocaleKeys.notValid.tr,
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15.sp,
                  //           color: Colors.red),
                  //     ),
                  //   );
                  // }
                  // return
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.usedIndicators.tr + " ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black87, fontSize: 18.sp),
                  ),
                  Text(
                    // "controller.usedConsumption.value.toStringAsFixed(2)" + 
                    ' ',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  Text(
                    metrics,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black87, fontSize: 18.sp),
                  ),
                  SizedBox(width: 30.w),
                ],
              )
              // },
              ),
          // ),
        ],
      ),
    );
  }
}
