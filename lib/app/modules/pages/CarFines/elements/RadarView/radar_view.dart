import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/radar_controller.dart';
import 'package:capar/app/modules/pages/Cabinet/pages/InfoTabPayments/elements/info_updater.dart';
import 'package:capar/app/modules/pages/CarFines/elements/RadarView/radar_item.dart';
import 'package:capar/app/modules/pages/CarFines/elements/radar_app_bar.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

import 'radar_filter_sheet.dart';

class RadarView extends StatefulWidget {
  const RadarView({Key? key}) : super(key: key);

  @override
  State<RadarView> createState() => _RadarViewState();
}

class _RadarViewState extends State<RadarView> {
  RadarController controller = Get.put(RadarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadarAppBar(),
      body: Get.put(HomeController()).cabinetInitialize.value.detail != null
          ? GetX<HomeController>(
              builder: (cab) {
                if (cab.cabinetInitialize.value.detail!.loc![0].crn!.isEmpty ||
                    cab.cabinetInitialize.value.detail!.loc![0].crn! == "-") {
                  return Spaces.horizontal(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.needToRegisterWithCar.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(height: 20.h),
                        MaterialButton(
                          onPressed: () {
                            Get.to(() =>
                                    InfoUpdater(enmTextFielType.carNumField))!
                                .then((value) => controller.loadFine());
                          },
                          color: Theme.of(context).colorScheme.secondary,
                          padding: const EdgeInsets.all(16),
                          shape: const CircleBorder(),
                          //textColor: Colors.white,
                          child: const Icon(
                            Icons.add,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (controller.isFetchError.value) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(LocaleKeys.somethingWrong.tr),
                              IconButton(
                                  onPressed: () => controller.loadFine(),
                                  icon: const Icon(Icons.refresh))
                            ],
                          ),
                        );
                      }
                      if (controller.fines.value.detail!.loc![0].car!.isEmpty) {
                        return Center(
                          child: Text(LocaleKeys.respEmpty.tr),
                        );
                      }
                      return RefreshIndicator(
                          onRefresh: () => controller.loadFine(),
                          child: FineItem()
                          // AlignedGridView.count(
                          //   crossAxisCount: 1,
                          //   mainAxisSpacing: 30.h,
                          //   padding:
                          //       EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                          //   itemCount:
                          //       controller.fines.value.detail!.loc![0].car!.length,
                          //   crossAxisSpacing: 4,
                          //   itemBuilder: (context, index) {
                          //     debugPrint(
                          //         "${controller.fines.value.detail!.loc![0].car![index]}");
                          //     return FineItem();
                          //   },
                          // ),
                          );
                    },
                  );
                }
              },
            )
          : Center(
              child: Text(LocaleKeys.error.tr),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(
          RadarSheet(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.r),
            ),
          ),
        ),
        child: Icon(Icons.filter_alt_rounded),
      ),
    );
  }
}
