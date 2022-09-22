import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CaparAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CaparAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, //Theme.of(context).primaryColor,
      automaticallyImplyLeading: false,
      titleSpacing: 20.w,
      title: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey.shade200,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            LocaleKeys.callToCapar.tr,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 20.sp,
                  color: Colors.grey.shade200,
                  fontWeight: FontWeight.w400,
                ),
          ),
          const Spacer(),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
