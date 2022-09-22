import 'package:capar/app/modules/controllers/trek_controller.dart';
import 'package:capar/app/routes/app_pages.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TeracNumberkItem extends GetView<TrekController> {
  const TeracNumberkItem({Key? key, required this.trackNum}) : super(key: key);
  final String trackNum;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: Theme.of(context).errorColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) {},
      confirmDismiss: (direction) {
        return Get.defaultDialog<bool>(
          title: LocaleKeys.attention.tr,
          content: Text(LocaleKeys.delWarr.tr, textAlign: TextAlign.center),
          onCancel: () => Get.back<bool>(result: false),
          onConfirm: () {
            controller.deleteNumber(trackNum);
            Get.back<bool>(result: true);
          },
        );
      },
      child: InkWell(
        onTap: () => Get.toNamed(Routes.trek, arguments: trackNum),
        child: Container(
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
          decoration: BoxDecoration(
              color: Get.isDarkMode ? layerDark1 : Colors.white,
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: MyPalette.itemShadow()),
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
          child: Row(
            children: [
              Container(
                width: 87.w,
                height: 87.h,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? layerDark2 : boxLight,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: SvgPicture.asset(
                    MyAssetsImages.svgBox,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Text(
                  '${LocaleKeys.trac.tr}#: $trackNum',
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
