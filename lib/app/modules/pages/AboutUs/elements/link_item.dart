import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/values/globals.dart';
import '../../../../../core/apperience/theme.dart';

class LinkItem extends StatelessWidget {
  const LinkItem(
      {Key? key,
      required this.url,
      required this.iconPath,
      required this.index,
      required this.title})
      : super(key: key);
  final String url;
  final String iconPath;
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index.isEven
          ? EdgeInsets.only(
              right: 30.w, left: 8.w, bottom: 8.h, top: index < 3 ? 30.h : 8.h)
          : EdgeInsets.only(
              left: 30.w, right: 8.w, bottom: 8.h, top: index < 3 ? 30.h : 8.h),
      child: GestureDetector(
        child: Container(
          width: 142.w,
          height: 168.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              color: Get.isDarkMode ? layerDark1 : Colors.white,
              boxShadow: MyPalette.itemShadow()),
          child: Column(
            children: [
              Container(
                width: 121.w,
                height: 120.h,
                margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                  color: Get.isDarkMode ? layerDark2 : boxLight2,
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SvgPicture.asset(iconPath)),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          height: 1.h),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () async => await launch(url),
      ),
    );
  }
}
