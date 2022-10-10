import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class PayFinishContent extends GetView<ToleglerController> {
  PayFinishContent(
      {Key? key,
      required this.saverIfSuccess,
      required this.forWhat,
      required this.howMuch,
      this.withCard = true})
      : super(key: key);
  final GlobalKey<FormFieldState> _keyCode = GlobalKey<FormFieldState>();
  final TextEditingController codeController = TextEditingController();
  final String forWhat;
  final String howMuch;
  final bool withCard;
  final Function() saverIfSuccess;

  chekAndFinishPay(String smsCode) async {
    if (!_keyCode.currentState!.validate()) return;
    // var rez = await controller.checkSMS(smsCode);
    // if (rez) {
    //   saverIfSuccess();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440.h,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spaces.horizontal(
            Text(
              LocaleKeys.confirTheCode.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.h),
          Spaces.horizontal(
            Row(
              children: [
                Expanded(
                  child: UIElements.customTextField(
                    key: _keyCode,
                    type: enmTextFielType.kod,
                    textController: codeController,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: Obx(
                    () {
                      if (controller.resendCode.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        );
                      }
                      return IconButton(
                        onPressed: () {},
                        // => controller.resendCodeHalkBank(),
                        icon: Icon(
                          Icons.restart_alt_rounded,
                          size: 35,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      forWhat,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                            fontSize: 16.sp,
                          ),
                    ),
                    Text(
                      howMuch + " ",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      LocaleKeys.manat.tr,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.sp,
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                if (!withCard)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.payWithTMcell.tr,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "${Get.find<HomeController>().cabinetInitialize.value.detail!.loc![0].mob}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                if (withCard)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.card.value.name,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "**** **** **** " +
                            controller.card.value.bind.split(" ").last,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 13.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                SizedBox(height: 5.h),
                if (withCard)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.card.value.cardHolder,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 13.sp, color: Colors.grey),
                      ),
                      Text(
                        controller.card.value.expiredDate,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 13.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                //Divider(),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Spaces.horizontal(
            Obx(
              () => SizedBox(
                height: 50.h,
                width: controller.payementRequesting.value
                    ? 50.w
                    : double.infinity,
                child: FloatingActionButton.extended(
                  isExtended: true,
                  onPressed: () {
                    if (controller.payementRequesting.value) return;
                    chekAndFinishPay(codeController.text);
                  },
                  label: controller.payementRequesting.value
                      ? Center(child: CircularProgressIndicator())
                      : Text(
                          LocaleKeys.pay.tr,
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
          ),
        ],
      ),
    );
  }
}
