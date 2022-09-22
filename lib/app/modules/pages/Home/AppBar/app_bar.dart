import 'package:badges/badges.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const HomeAppBar({
//     Key? key,
//     required this.topHeight,
//   }) : super(key: key);
//   final double topHeight;
//   @override
//   Size get preferredSize => Size.fromHeight(topHeight + 50.h);

//   @override
//   Widget build(BuildContext context) {
//     final homeController = Get.find<HomeController>();
//     return Container(
//       height: topHeight + 50.h,
//       //padding: EdgeInsets.only(bottom: 5.h),
//       decoration: BoxDecoration(
//         color: Get.isDarkMode ? layerDark1 : Colors.white,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(30.r),
//           bottomRight: Radius.circular(30.r),
//         ),
//         boxShadow: MyPalette.itemShadow(),
//       ),
//       child: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         title: Column(
//           children: [
//             //SizedBox(height: topHeight),
//             SizedBox(
//               height: 50.h,
//               child: Row(
//                 children: [
//                   SizedBox(width: 10.w),
//                   IconButton(
//                     onPressed: () => Get.find<HomeController>().openDrawer(),
//                     icon: SvgPicture.asset(
//                       MyAssetsImages.svgMenu,
//                     ),
//                   ),
//                   SizedBox(width: 5.w),
//                   Expanded(
//                     child: Text(
//                       "Çapar",
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context).textTheme.headline6!.copyWith(
//                           fontSize: 20.sp, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   //SizedBox(width: 25.w),
//                 ],
//               ),
//             )
//           ],
//         ),
//         actions: [
//           Obx(
//             () => Badge(
//               showBadge: homeController.showCabBadge(),
//               badgeColor: Theme.of(Get.context!).errorColor,
//               animationType: BadgeAnimationType.scale,
//               shape: BadgeShape.square,
//               position: BadgePosition.topEnd(end: 0, top: 5),
//               borderRadius: BorderRadius.circular(10),
//               badgeContent: Container(),
//               child: IconButton(
//                 onPressed: () =>
//                     homeController.scaffoldKey.currentState!.openEndDrawer(),
//                 icon: SvgPicture.asset(
//                   MyAssetsImages.svgCabinet,
//                   color: Theme.of(context).primaryColor,
//                   height: 50.h,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 25.w),
//         ],
//       ),
//     );
//   }
// }

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeController controller = Get.put(HomeController());
  InitializerController initController = Get.put(InitializerController());
  HomeAppBar({
    Key? key,
    required this.topHeight,
  }) : super(key: key);
  final double topHeight;
  Size get preferredSize => Size.fromHeight(topHeight + 50.h);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200.h,
        margin: const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 10),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.cabinetInitialize.value.detail != null
                      ? '${controller.cabinetInitialize.value.detail!.loc![0].frn} '
                          '${controller.cabinetInitialize.value.detail!.loc![0].lsn}'
                      : "Bayram Komekov",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  controller.cabinetInitialize.value.detail != null
                      ? '+993${controller.cabinetInitialize.value.detail!.loc![0].mob}'
                      : '+99365853833',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Center(
            //   child: Column(
            //     children: [
            //       Text(
            //         initController.initializer.value.detail != null
            //             ? LocaleKeys.balance.tr
            //             : "Balance",
            //         style: Theme.of(context).textTheme.headline6!.copyWith(
            //             fontSize: 20.sp, fontWeight: FontWeight.bold),
            //       ),
            //       SizedBox(
            //         height: 10.h,
            //       ),
            //       Text(
            //         initController.initializer.value.detail != null
            //             ? '${initController.initializer.value.detail!.loc![0].mb} '
            //             : "25.0 manat",
            //         style: Theme.of(context).textTheme.headline6!.copyWith(
            //             fontSize: 20.sp, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Get.find<HomeController>().openDrawer(),
                icon: SvgPicture.asset(
                  MyAssetsImages.svgMenu,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
