import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/pages/Payments/Suw_TuT/history_page.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuwTutScreen extends StatefulWidget {
  const SuwTutScreen({Key? key}) : super(key: key);

  @override
  State<SuwTutScreen> createState() => _SuwTutScreenState();
}

class _SuwTutScreenState extends State<SuwTutScreen> {
  HomeController homeController = Get.put(HomeController());
  int amountPrice = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 5.w),
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              LocaleKeys.suw_tut.tr,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      body: Spaces.horizontal(
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "${LocaleKeys.phoneNum.tr}: ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    homeController.cabinetInitialize.value.detail != null
                        ? homeController
                            .cabinetInitialize.value.detail!.loc![0].mob
                            .toString()
                        : LocaleKeys.error.tr,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "${LocaleKeys.address.tr}: ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    homeController.cabinetInitialize.value.detail != null
                        ? homeController
                            .cabinetInitialize.value.detail!.loc![0].add
                            .toString()
                        : LocaleKeys.error.tr,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Image.asset(MyAssetsImages.suwButylka),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          removeAmount();
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      width: 150.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                          color: Theme.of(context).primaryColor),
                      child: Text(
                        "$amountPrice",
                        style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          addAmount();
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                label: Text(
                  LocaleKeys.orderWater.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => WaterHistoryPAge());
        },
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        label: const CircleAvatar(
          child: Icon(
            Icons.history,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void addAmount() {
    setState(() {
      amountPrice++;
    });
  }

  void removeAmount() {
    setState(() {
      if (amountPrice != 1) {
        amountPrice--;
      }
    });
  }
}
