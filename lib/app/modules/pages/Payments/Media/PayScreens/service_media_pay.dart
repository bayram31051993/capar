import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/app/modules/pages/Payments/Media/PayScreens/media_check_app_bar.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceMediaOay extends GetView<ToleglerController> {
  final enmPaymentMedia type;
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  ServiceMediaOay(this.type);

  enmTextFielType fielType(enmPaymentMedia type) {
    if (type == enmPaymentMedia.agtsIpTv) {
      return enmTextFielType.agtsPhoneField;
    } else if (type == enmPaymentMedia.cabelTV) {
      return enmTextFielType.homePhoneField;
    } else {
      return enmTextFielType.agtsPhoneField;
    }
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
        body:
            // Obx(
            //   () {
            AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child:
          //  SingleChildScrollView(
          //         child: Column(
          //           //mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             AppBar(
          //               automaticallyImplyLeading: false,
          //               titleSpacing: 20.w,
          //               backgroundColor: Colors.transparent,
          //               title: Row(
          //                 children: [
          //                   IconButton(
          //                     onPressed: () => Get.back(),
          //                     icon: Icon(
          //                       Icons.arrow_back,
          //                       color:
          //                           Theme.of(context).colorScheme.secondary,
          //                     ),
          //                   ),
          //                   SizedBox(width: 10.w),
          //                   Expanded(
          //                     child: Text(
          //                       LocaleKeys.confirTheCode.tr,
          //                       overflow: TextOverflow.fade,
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .bodyText1!
          //                           .copyWith(
          //                               color: Theme.of(context)
          //                                   .colorScheme
          //                                   .secondary,
          //                               fontSize: 18.sp),
          //                       textAlign: TextAlign.center,
          //                     ),
          //                   ),
          //                   SizedBox(width: 10.w),
          //                 ],
          //               ),
          //             ),
          //             SizedBox(height: 20.h),
          //             // PayFinishContent(
          //             //   saverIfSuccess: saveIfSucces,
          //             //   forWhat: controller.phoneNumber.text,
          //             //   howMuch: _amountController.text,
          //             // )
          //           ],
          //         ),
          //       )
          //     :
          Form(
        key: _keyForm,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MediaCheckAppBar(type: type),
            SizedBox(height: 20.h),
            Spaces.horizontal(
              UIElements.customTextField(
                type: fielType(type),
                textController: _phone,
                // enabled: !controller.openCodeField.value,
                //autoFocux: true,
              ),
            ),
            // MyStatefulWidget(),
            Spaces.horizontal(
              UIElements.simpleTextField(
                type: enmTextFielType.amonutField,
                textController: _amountController,
              ),
            ),
            SizedBox(height: 20.h),
            Spaces.horizontal(
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
                    // if (controller.codeRequestSending.value) return;
                    // payProces(type);
                  },
                  label:
                      // controller.codeRequestSending.value
                      //     ? const Center(
                      //         child: CircularProgressIndicator())
                      //     :
                      Text(
                    LocaleKeys.getCode.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
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
    )
        // },
        // ),
        );
  }
}
