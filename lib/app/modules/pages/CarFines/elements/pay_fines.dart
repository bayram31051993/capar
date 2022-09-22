import 'package:auto_size_text/auto_size_text.dart';
import 'package:capar/app/modules/pages/CarFines/elements/Protokol/protkol_fines.dart';
import 'package:capar/app/modules/pages/CarFines/elements/VideoPhoto/vidoe_photo.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'radar_app_bar.dart';

class CarFinesPay extends StatelessWidget {
  const CarFinesPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  RadarAppBar(),
      body: Spaces.horizontal(
        Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: (() => Get.to(() => ProtocolFines())),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 135.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                    ),
                    child: Image.asset(
                      MyAssetsImages.payProtokol,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 135.w,
                  child: AutoSizeText(
                    LocaleKeys.payProtokol.tr,
                    style: TextStyle(fontSize: 15.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => VideoPhotoFines());
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: 135.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                    ),
                    child: Image.asset(
                      MyAssetsImages.payWidoe,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: 135.w,
                    child: AutoSizeText(
                      LocaleKeys.payWideoPhoto.tr,
                      style: TextStyle(fontSize: 15.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
