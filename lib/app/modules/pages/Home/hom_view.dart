import 'package:capar/app/data/services/packages/fab_menu.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/pages/AboutUs/about.dart';
import 'package:capar/app/modules/pages/Cabinet/elements/cabinet_view.dart';
import 'package:capar/app/modules/pages/Home/body/home_body.dart';
import 'package:capar/app/modules/pages/Home/drawer/drawer.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: controller.scaffoldKey,
      drawer: const WwDrawer(),
      endDrawer: SizedBox(
        width: 360.w,
        child: CabinetView(),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (controller.scaffoldKey.currentState!.isEndDrawerOpen) {
            Get.back();
            return false;
          } else {
            var b = (await Get.defaultDialog<bool>(
                  content: Text(
                    LocaleKeys.exitWarn.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(Get.context!).textTheme.bodyText1,
                  ),
                  title: LocaleKeys.attention.tr,
                  onCancel: () => Get.back<bool>(result: false),
                  onConfirm: () => Get.back<bool>(result: true),
                )) ??
                false;
            return b;
          }
        },
        child: HomeBody(),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: SizedBox(
      //   height: 65.h,
      //   width: 65.w,
      //   child: FloatingActionButton(
      //     backgroundColor: Theme.of(context).primaryColor.withOpacity(0.75),
      //     onPressed: () => Get.to(() => AboutUs()),
      //     child: Icon(
      //       Icons.support_agent,
      //       color: Colors.grey.shade200,
      //       size: 35.h,
      //     ),
      //     elevation: 0,
      //   ),
      // ),
      floatingActionButton: FabCircularMenu(
        key: controller.fabKey,
        fabOpenIcon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        fabCloseIcon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onDisplayChange: (val) {
          if (val) {
            // Get.defaultDialog(
            //   title: 'OK',
            //   middleText: "",
            //   titleStyle: Theme.of(context)
            //       .textTheme
            //       .bodyText1!
            //       .copyWith(color: Theme.of(context).primaryColor),
            //   middleTextStyle: Theme.of(context).textTheme.bodyText2,
            // );
            // controller.closeFab();
          }
        },
        fabOpenColor: Theme.of(context).errorColor,
        fabCloseColor: Theme.of(context).primaryColor,
        ringColor: Theme.of(context).primaryColor.withOpacity(0.4),
        children: <Widget>[
          CircleAvatar(
            radius: 30.r,
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              icon: const Icon(
                Icons.support_agent,
                color: Colors.white,
              ),
              //color: ccCream,
              onPressed: () {
                controller.closeFab();
                Get.to(() => AboutUs());
              },
            ),
          ),
          CircleAvatar(
            radius: 30.r,
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              icon: const Icon(
                Icons.qr_code_2_rounded,
                color: Colors.white,
              ),
              //color: ccCream,
              onPressed: () {
                var snackBar = SnackBar(
                  content: Text(
                    LocaleKeys.coming_soon.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Arial",
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
          CircleAvatar(
            radius: 30.r,
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              icon: const Icon(
                Icons.track_changes,
                color: Colors.white,
              ),
              //color: ccCream,
              onPressed: () {
                // Get.to(() => TrekView());
                controller.closeFab();
              },
            ),
          ),
        ],
      ),
    );
  }
}
