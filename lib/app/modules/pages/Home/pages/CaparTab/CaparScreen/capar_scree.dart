import 'package:capar/app/modules/pages/Home/pages/CaparTab/CaparScreen/capar_app_bar.dart';
import 'package:capar/app/modules/pages/Home/pages/CaparTab/elements/trek_view.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:capar/core/utils/enums.dart';

class CaparScreen extends StatelessWidget {
  const CaparScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CaparAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Spaces.horizontal(
                  Text(
                    LocaleKeys.callToCapar.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Spaces.horizontal(
                  Text(
                    LocaleKeys.caparTitle.tr,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Spaces.horizontal(
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      heroTag: "callCapar",
                      isExtended: true,
                      onPressed: () {},
                      // => Get.to(() => CaparView()),
                      label: Text(
                        LocaleKeys.fillData.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Spaces.horizontal(
                  Text(
                    LocaleKeys.trac.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Spaces.horizontal(
                  Text(
                    LocaleKeys.trackTitle.tr,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Spaces.horizontal(
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      heroTag: "trackNums",
                      isExtended: true,
                      onPressed: () => Get.to(() => TrekView()),
                      label: Text(
                        LocaleKeys.trackNum.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
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
              // color: Theme.of(context).primaryColor,
              // gradient: MyPalette.payItemsColor(enmPaymentType.capar),

              boxShadow: MyPalette.bannerShadow(),
            ),
            child: Column(
              children: [
                CaparAppBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Hero(
                      tag: "enmPaymentType.capar.name",
                      child: Lottie.asset(
                        "assets/images/del3.json",
                        fit: BoxFit.contain,
                      ),
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
