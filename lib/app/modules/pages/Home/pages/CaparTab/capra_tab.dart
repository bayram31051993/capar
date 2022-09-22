import 'package:capar/app/modules/pages/Home/pages/CaparTab/CaparScreen/capar_scree.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../core/utils/enums.dart';

class CaparTab extends StatelessWidget {
  const CaparTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        margin: EdgeInsets.only(
            left: 30.w, right: 30.w, bottom: 20.h, top: height + 65.h),
        height: 145.h,
        width: 300.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: Get.isDarkMode ? layerDark1 : Colors.white,
            boxShadow: MyPalette.itemShadow()),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              // gradient: MyPalette.payItemsColor(enmPaymentType.capar),
              //color: Theme.of(context).primaryColor,
              boxShadow: MyPalette.itemShadow()),
          child: Row(
            children: [
              SizedBox(
                width: 175.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Hero(
                    tag: "enmPaymentType.capar.name",
                    child: Lottie.asset(
                      MyAssetsImages.aniDelivery,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LocaleKeys.courier.tr + '\n',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade200),
                        ),
                        TextSpan(
                          text: LocaleKeys.caparAbout.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  height: 1.5,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade200),
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
      onTap: () => Get.to(() => CaparScreen()),
    );
  }
}
