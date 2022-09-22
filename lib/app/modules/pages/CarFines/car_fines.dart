import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/CarFines/elements/RadarView/radar_view.dart';
import 'package:capar/app/modules/pages/CarFines/elements/car_fines_app_bar.dart';
import 'package:capar/app/modules/pages/CarFines/elements/car_fines_law.dart';
import 'package:capar/app/modules/pages/Payments/CheckOutScreen/check_out_screen.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class CarFinesScreen extends StatelessWidget {
  const CarFinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fines = Get.find<InitializerController>().initializer.value.detail !=
            null
        ? Get.find<InitializerController>().initializer.value.detail!.loc![0].fi
        : LocaleKeys.error;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity, height: 350.h),
                SizedBox(height: 30.h),
                Spaces.horizontal(
                  Text(
                    LocaleKeys.fraffFinesPay.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10.h),
                Spaces.horizontal(
                  Text(
                    LocaleKeys.fineTitle.tr,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                  ),
                ),
                SizedBox(height: 10.h),
                Spaces.horizontal(
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      heroTag: "callCapar",
                      isExtended: true,
                      onPressed: () => Get.to(
                          () => CheckOutScreen(type: enmPaymentType.pygg)),
                      label: Text(
                        LocaleKeys.fillData.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade200,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Spaces.horizontal(
                  Text(
                    LocaleKeys.findRadar.tr,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                SizedBox(height: 10.h),
                Spaces.horizontal(
                  Text(
                    LocaleKeys.radarTitle.tr,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                SizedBox(height: 10.h),
                Spaces.horizontal(
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      heroTag: "trackNums",
                      isExtended: true,
                      onPressed: () => Get.to(() => const RadarView()),
                      label: Text(
                        fines == 0
                            ? LocaleKeys.fines.tr
                            : "${LocaleKeys.fines.tr} ($fines)",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Spaces.horizontal(
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      heroTag: "law",
                      isExtended: true,
                      onPressed: () => Get.to(() => const CarFinesLae()),
                      label: Text(
                        LocaleKeys.law.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 350.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
              ),
              gradient: MyPalette.payItemsColor(enmPaymentType.pygg),
              boxShadow: MyPalette.bannerShadow(),
            ),
            child: Column(
              children: [
                CarFinesAppBar(),
                Expanded(
                  child: Spaces.horizontal(
                    Hero(
                      tag: enmPaymentType.pygg.name,
                      child: Image.asset(MyAssetsImages.pngPygg),
                    ),
                  ),
                ),
                SizedBox(height: 30.h)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
