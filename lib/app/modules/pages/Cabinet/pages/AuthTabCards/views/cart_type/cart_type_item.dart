import 'package:capar/app/modules/controllers/card_controller.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/core/values/strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class CarTypeItem extends GetView<CardController> {
  const CarTypeItem(this.type);
  final enmBankKartlar type;
  @override
  Widget build(BuildContext context) {
    var name = Strings.pathToBankName(type);
    return InkWell(
      child: Container(
        height: 65.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        // margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? layerDark2 : Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: MyPalette.itemShadow(),
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18.sp,
              ),
          overflow: TextOverflow.fade,
        ),
      ),
      onTap: () {
        controller.kartType(name);
        controller.cardTypeUpdate(type);
        Get.back();
      },
    );
  }
}
