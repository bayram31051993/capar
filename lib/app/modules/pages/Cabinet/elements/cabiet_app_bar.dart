import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/pages/InitializerView/initializer_view.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CabinetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CabinetAppBar({Key? key}) : super(key: key);

  void logout() {
    Get.defaultDialog(
        title: LocaleKeys.attention.tr,
        content: Text(
          LocaleKeys.logoutWarn.tr,
          textAlign: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.bodyText1,
        ),
        textCancel: LocaleKeys.cansel.tr,
        onCancel: () => Get.back(),
        textConfirm: "Ok",
        onConfirm: () {
          Get.back();
          Get.find<HomeController>().logOut();
        });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 20.w,
      backgroundColor: Theme.of(context).primaryColor,
      title: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              LocaleKeys.cabinet.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade200),
            ),
          ),
          SizedBox(width: 10.w),
          SizedBox(
            height: 30.h,
            child: TextButton(
                onPressed: () => logout(),
                child: Text(
                  LocaleKeys.logout.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade200),
                ),
                style: MyButtons.square),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
