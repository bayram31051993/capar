import 'package:badges/badges.dart';
import 'package:capar/app/data/api/GetAllFines/get_all_fines.dart';
import 'package:capar/app/data/models/GetAllRadarFinesModel/get_all_radar_view_model.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/radar_controller.dart';
import 'package:capar/app/modules/pages/CarFines/elements/Protokol/protkol_fines.dart';
import 'package:capar/app/modules/pages/CarFines/elements/VideoPhoto/vidoe_photo.dart';
import 'package:capar/app/modules/pages/CarFines/elements/radar_app_bar.dart';
import 'package:capar/app/modules/pages/Payments/ServicesPayView/services_pay_view.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/core/values/strings.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FineItem extends StatefulWidget {
  FineItem({Key? key}) : super(key: key);

  @override
  State<FineItem> createState() => _FineItemState();
}

class _FineItemState extends State<FineItem> {
  GetAllFinesPost getAllPyggPost = GetAllFinesPost();
  HomeController carNum = Get.put(HomeController());
  RadarController controller = Get.put(RadarController());
  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      itemCount: controller.fines.value.detail!.loc![0].car!.length,
      itemBuilder: (context, i) {
        return Badge(
          badgeColor: controller.fines.value.detail?.loc![0].car![i].status == 0
              ? Theme.of(context).errorColor
              : Theme.of(context).primaryColor,
          animationType: BadgeAnimationType.scale,
          shape: BadgeShape.square,
          position: BadgePosition.topEnd(end: -8.w, top: -8.h),
          borderRadius: BorderRadius.circular(10),
          badgeContent: Container(
            height: 22.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: controller.fines.value.detail?.loc![0].car![i].status == 0
                  ? Theme.of(context).errorColor
                  : Theme.of(context).primaryColor,
            ),
            child: Text(
              controller.fines.value.detail?.loc![0].car![i].status == 0
                  ? LocaleKeys.unpaid.tr
                  : LocaleKeys.paid.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 10.sp, color: Colors.grey.shade200),
            ),
          ),
          child: Material(
            child: GestureDetector(
              onTap: () {
                if (controller.fines.value.detail?.loc![0].car![i].status ==
                    0) {
                  if (controller
                          .fines.value.detail?.loc![0].car![i].karar!.length ==
                      7) {
                    Get.to(() => ProtocolFines());
                  } else {
                    Get.to(() => VideoPhotoFines());
                  }
                } else {
                  // Get.to(
                  //   () => RecipScreen(
                  //     singleFine: fine.karar,
                  //     tolegType: enmPaymentType.pygg,
                  //   ),
                  // );
                }
              },
              child: Container(
                height: 213.h,
                width: 300.w,
                decoration: BoxDecoration(
                    color: Get.isDarkMode ? layerDark1 : Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: MyPalette.itemShadow()),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.fines.value.detail != null
                                ? controller
                                    .fines.value.detail!.loc![0].car![i].karar
                                    .toString()
                                : "Error",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                      child: Text(
                        LocaleKeys.fineNum.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 11.sp, color: Colors.grey),
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? layerDark2 : rowLight,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Text(
                              controller.fines.value.detail != null
                                  ? DateFormat("dd.MM.yyy").format(
                                      Strings.parserUniversal(controller
                                          .fines
                                          .value
                                          .detail!
                                          .loc![0]
                                          .car![i]
                                          .karardate
                                          .toString()))
                                  : "Error",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              controller.fines.value.detail != null
                                  ? DateFormat("HH:mm").format(
                                      Strings.parserUniversal(controller
                                          .fines
                                          .value
                                          .detail!
                                          .loc![0]
                                          .car![i]
                                          .karardate
                                          .toString()))
                                  : "Error",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                      child: Row(
                        children: [
                          SizedBox(width: 40.w),
                          Expanded(
                            child: Text(
                              LocaleKeys.arrDateFine.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 11.sp, color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              LocaleKeys.arrTime.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 11.sp, color: Colors.grey),
                            ),
                          ),
                          SizedBox(width: 40.w),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? layerDark2 : rowLight,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Text(
                              controller.fines.value.detail != null
                                  ? controller.fines.value.detail!.loc![0]
                                      .car![0].bahasy
                                      .toString()
                                  : "Erorr",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              controller.fines.value.detail != null
                                  ? controller
                                      .fines.value.detail!.loc![0].car![i].fine
                                      .toString()
                                  : "Error",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                      child: Row(
                        children: [
                          SizedBox(width: 40.w),
                          Expanded(
                            child: Text(
                              LocaleKeys.amount.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 11.sp, color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              LocaleKeys.penalty.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 11.sp, color: Colors.grey),
                            ),
                          ),
                          SizedBox(width: 40.w),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
