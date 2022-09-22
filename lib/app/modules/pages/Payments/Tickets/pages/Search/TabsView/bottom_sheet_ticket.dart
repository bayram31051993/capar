import 'package:auto_size_text/auto_size_text.dart';
import 'package:capar/app/modules/controllers/ticket_controller.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetTicket extends StatelessWidget {
  BottomSheetTicket({Key? key}) : super(key: key);
  TicketController controller = Get.put(TicketController());
  int adult = 0;
  int child = 0;
  int babies = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.adult.tr,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    LocaleKeys.adultDesc.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15.sp),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(90, 192, 191, 191),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          controller.removeCount(adult);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      adult.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(90, 192, 191, 191),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          controller.updateCount(adult);
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.children.tr,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    LocaleKeys.childrenDesc.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15.sp),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(90, 192, 191, 191),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          controller.removeCount(child);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      child.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(90, 192, 191, 191),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          controller.updateCount(child);
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.babies.tr,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    LocaleKeys.babiesDesc.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15.sp),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(90, 192, 191, 191),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          controller.removeCount(babies);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      babies.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(90, 192, 191, 191),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          controller.updateCount(babies);
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          AutoSizeText(
            LocaleKeys.passengerDesc.tr,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.save.tr,
              style: Theme.of(Get.context!).textTheme.headline6!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade200),
            ),
          ),
        ],
      ),
    );
  }
}
