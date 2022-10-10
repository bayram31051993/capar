import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/Home/AppBar/app_bar.dart';
import 'package:capar/app/modules/pages/Home/pages/CaparTab/capra_tab.dart';
import 'package:capar/app/modules/pages/Home/pages/TolegItem/toleg_item.dart';
import 'package:capar/core/values/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/enums.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());
  InitializerController initController = Get.put(InitializerController());
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   // appBar: HomeAppBar(topHeight: MediaQuery.of(context).viewPadding.top),
    //   body: Stack(
    //     children: [
    //       RefreshIndicator(
    //         onRefresh: () => Get.find<InitializerController>().loadInitials(),
    //         child: Material(
    //           child: SizedBox(
    //             width: 360.w,
    //             height: 800.h,
    //             child: SingleChildScrollView(
    //               scrollDirection: Axis.vertical,
    //               child: Wrap(
    //                 children: [
    //                   Container(
    //                     height: 200.h,
    //                     margin:
    //                         const EdgeInsets.only(top: 100, left: 15, right: 15),
    //                     color: Colors.transparent,
    //                     child: Center(
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 controller.cabinetInitialize.value.detail !=
    //                                         null
    //                                     ? '${controller.cabinetInitialize.value.detail!.loc![0].frn} '
    //                                         '${controller.cabinetInitialize.value.detail!.loc![0].lsn}'
    //                                     : "Bayram Komekov",
    //                                 style: Theme.of(context)
    //                                     .textTheme
    //                                     .headline6!
    //                                     .copyWith(
    //                                         fontSize: 20.sp,
    //                                         fontWeight: FontWeight.bold),
    //                               ),
    //                               SizedBox(
    //                                 height: 10.h,
    //                               ),
    //                               Text(
    //                                 controller.cabinetInitialize.value.detail !=
    //                                         null
    //                                     ? '+993${controller.cabinetInitialize.value.detail!.loc![0].mob}'
    //                                     : '+99365853833',
    //                                 style: Theme.of(context)
    //                                     .textTheme
    //                                     .headline6!
    //                                     .copyWith(
    //                                         fontSize: 20.sp,
    //                                         fontWeight: FontWeight.bold),
    //                               ),
    //                             ],
    //                           ),
    //                           // Center(
    //                           //   child: Column(
    //                           //     children: [
    //                           //       Text(
    //                           //         initController.initializer.value.detail != null
    //                           //             ? LocaleKeys.balance.tr
    //                           //             : "Balance",
    //                           //         style: Theme.of(context).textTheme.headline6!.copyWith(
    //                           //             fontSize: 20.sp, fontWeight: FontWeight.bold),
    //                           //       ),
    //                           //       SizedBox(
    //                           //         height: 10.h,
    //                           //       ),
    //                           //       Text(
    //                           //         initController.initializer.value.detail != null
    //                           //             ? '${initController.initializer.value.detail!.loc![0].mb} '
    //                           //             : "25.0 manat",
    //                           //         style: Theme.of(context).textTheme.headline6!.copyWith(
    //                           //             fontSize: 20.sp, fontWeight: FontWeight.bold),
    //                           //       ),
    //                           //     ],
    //                           //   ),
    //                           // ),
    //                           Align(
    //                             alignment: Alignment.topRight,
    //                             child: IconButton(
    //                               onPressed: () =>
    //                                   Get.find<HomeController>().openDrawer(),
    //                               icon: SvgPicture.asset(
    //                                 MyAssetsImages.svgMenu,
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   ...enmPaymentType.values.map(
    //                     (e) {
    //                       // if (e == enmPaymentType.capar) {
    //                       //   return CaparTab();
    //                       // }
    //                       return TolegItemView(
    //                           e, enmPaymentType.values.indexOf(e));
    //                     },
    //                   ).toList()
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 3),
            child: RefreshIndicator(
              onRefresh: () => Get.find<InitializerController>().loadInitials(),
              child: Material(
                child: SizedBox(
                  width: 360.w,
                  height: 800.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      children: [
                        SizedBox(
                          height: 110.h,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 50, left: 3, right: 3, bottom: 25),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.cabinetInitialize.value
                                                    .detail !=
                                                null
                                            ? '${controller.cabinetInitialize.value.detail!.loc![0].frn} '
                                                '${controller.cabinetInitialize.value.detail!.loc![0].lsn}'
                                            : "Bayram Komekov",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontSize: 35.sp,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        controller.cabinetInitialize.value
                                                    .detail !=
                                                null
                                            ? '+993${controller.cabinetInitialize.value.detail!.loc![0].mob}'
                                            : '+99365853833  50.0 tmt',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  alignment: Alignment.topCenter,
                                  onPressed: () =>
                                      Get.find<HomeController>().openDrawer(),
                                  icon: SvgPicture.asset(
                                    MyAssetsImages.svgMenu,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ...enmPaymentType.values.map(
                          (e) {
                            // if (e == enmPaymentType.capar) {
                            //   return CaparTab();
                            // }
                            return TolegItemView(
                                e, enmPaymentType.values.indexOf(e));
                          },
                        ).toList()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
