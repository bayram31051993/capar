import 'package:badges/badges.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/CarFines/car_fines.dart';
import 'package:capar/app/modules/pages/Payments/Communal/PayScreen/communal_check.dart';
import 'package:capar/app/modules/pages/WelcomeScreen/WeolcomePage/welcome_screen.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommunalsItem extends GetView<InitializerController> {
  final enmPaymentCommunal tolegType;
  final int index;
  CommunalsItem(this.tolegType, this.index);

  @override
  Widget build(BuildContext context) {
    final title = Strings.communalTittletoPayment(tolegType).tr;

    return Obx(
      () {
        return GestureDetector(
            child: Padding(
              padding: index.isEven
                  ? EdgeInsets.only(right: 5, left: 8.w, bottom: 5.h, top: 8.h)
                  : EdgeInsets.only(left: 5, right: 8.w, bottom: 5.h, top: 8.h),
              child: Container(
                width: 165.w,
                height: 170.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    color: Get.isDarkMode ? layerDark1 : Colors.white,
                    boxShadow: MyPalette.itemShadow()),
                child: Column(
                  children: [
                    Badge(
                      showBadge: controller.badgeCommunal(tolegType),
                      badgeColor: controller.isGoodCommunal(tolegType)
                          ? greenGlobal
                          : Theme.of(Get.context!).errorColor,
                      animationType: BadgeAnimationType.scale,
                      shape: BadgeShape.square,
                      position: BadgePosition.topEnd(end: -15, top: -10),
                      borderRadius: BorderRadius.circular(10),
                      badgeContent: controller.isLoading.value
                          ? null
                          : ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 30.w),
                              child: Container(
                                height: 20.h,
                                //width: 30.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Text(
                                  controller.displayCommunal(tolegType),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Colors.grey.shade100,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                      child: Stack(
                        children: [
                          Container(
                            width: 120.w,
                            height: 100.h,
                            margin: EdgeInsets.only(top: 10.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.r),

                              //color: Theme.of(context).primaryColor,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 5, right: 5, top: 8),
                              child: Hero(
                                tag: tolegType.name,
                                child: Image.asset(
                                  Strings.pathToCommunal(
                                    tolegType,
                                  ),
                                  //color: Colors.white,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          // ASTU Telekom logo
                          // Positioned(
                          //   top: 0,
                          //   left: 0.w,
                          //   child: Container(
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 5.w, vertical: 5.h),
                          //     margin: EdgeInsets.only(top: 10.h),
                          //     alignment: Alignment.centerLeft,
                          //     height: 30.h,
                          //     width: 120.w,
                          //     child: UIElements.tolegItemLogo(tolegType),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 10.w, left: 2, right: 2),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        height: 1.h),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              // if (tolegType == enmPaymentType.student ||
              //     tolegType == enmPaymentType.licese ||
              //     tolegType == enmPaymentType.migration) {
              // DialogHandler.dialogMSG(enmDialogType.info,
              //       title: LocaleKeys.commingSoon.tr,
              //       onOkAction: () => Get.back());
              // } else {
              var auth = controller.token.value.toString();
              if (auth.isNotEmpty) {
                if (tolegType == enmPaymentType.pygg) {
                  Get.to(() => CarFinesScreen());
                }
                // else if (tolegType == enmPaymentType.licese) {
                //   // DialogHandler.dialogMSG(enmDialogType.info,
                //   //     title: LocaleKeys.commingSoon.tr,
                //   //     onOkAction: () => Get.back());
                //   var snackBar = SnackBar(
                //     content: Text(
                //       LocaleKeys.coming_soon.tr,
                //       style: const TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 20,
                //         fontFamily: "Arial",
                //       ),
                //       textAlign: TextAlign.center,
                //     ),
                //   );
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // }
                else {
                  Get.to(() => CommunalCheck(type: tolegType, parametrs: null));
                }
              } else {
                Get.to(() => WelcomeScreen());
              }
            }
            //},
            );
      },
    );
  }
}
