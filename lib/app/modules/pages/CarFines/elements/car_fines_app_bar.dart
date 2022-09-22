import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/pages/Cabinet/pages/InfoTabPayments/elements/info_updater.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class CarFinesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CarFinesAppBar({
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
            LocaleKeys.fraffFines.tr,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 20.sp,
                  color: Colors.grey.shade200,
                  fontWeight: FontWeight.w400,
                ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.to(() => InfoUpdater(enmTextFielType.carNumField));
              // if (Get.find<HomeController>()
              //     .cabinetInitialize
              //     .value
              //     .detail!
              //     .loc![0]
              //     .crn!
              //     .isNotEmpty) {
              //   Get.to(
              //     () => RecipScreen(
              //       singleFine: null,
              //       tolegType: enmPaymentType.pygg,
              //     ),
              //   );
              // } else {
              //   Get.to(() => InfoUpdater(enmTextFielType.carNumField))!.then(
              //     (value) => RecipScreen(
              //       singleFine: null,
              //       tolegType: enmPaymentType.pygg,
              //     ),
              //   );
              // }
            },
            icon: Icon(Icons.local_print_shop_outlined, color: Colors.black87),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
