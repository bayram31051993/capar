import 'package:capar/app/modules/controllers/radar_controller.dart';

import '../../../../../../../../../core/apperience/ui_elements.dart';
import '../../../../../../../../../core/utils/enums.dart';
import '../../../../../../../../../core/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/values/globals.dart';
import '../../../../../../../../../generated/locales.g.dart';

class RadarSheet extends GetView<RadarController> {
  const RadarSheet({
    Key? key,
  }) : super(key: key);
  static final TextEditingController _textEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      height: MediaQuery.of(context).viewInsets.bottom == 0 ? 300.h : 130.h,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? layerDark1 : Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r), topRight: Radius.circular(18.r)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 65.h,
            child: UIElements.customTextField(
              type: enmTextFielType.search,
              textController: _textEditingController,
              onChanging: (val) {
                print(' - - -$val');
                controller.searchType(val);
              },
              suffix: IconButton(
                onPressed: () {
                  _textEditingController.clear();
                  controller.removeSearch();
                },
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => controller.sortUp(),
                  icon: Icon(
                    Icons.arrow_circle_down,
                    color: Theme.of(context).primaryColor,
                    size: 30.h,
                  ),
                ),
                IconButton(
                  onPressed: () => controller.sortDown(),
                  icon: Icon(
                    Icons.arrow_circle_up,
                    color: Theme.of(context).primaryColor,
                    size: 30.h,
                  ),
                ),
                Obx(
                  () {
                    if (controller.isLoading.value) {
                      return SizedBox();
                    } else {
                      return SizedBox(
                        width: 130.w,
                        child: DropdownButton<int>(
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey.shade200),
                          isExpanded: true,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(15.r),
                          elevation: 0,
                          dropdownColor: Colors.grey.shade200,
                          icon: const Icon(
                            Icons.expand_more_rounded,
                          ),
                          value: controller.selectedIndex.value,
                          items: [
                            DropdownMenuItem(
                              value: 0,
                              child: Row(
                                children: [
                                  Container(
                                    height: 30.h,
                                    width: 30.w,
                                    margin: EdgeInsets.only(right: 10.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                    child: Text(
                                      "${controller.allFines.length}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.sp,
                                              color: Colors.grey.shade200,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      LocaleKeys.all.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Container(
                                    height: 30.h,
                                    width: 30.w,
                                    margin: EdgeInsets.only(right: 10.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).errorColor),
                                    child: Text(
                                      "${controller.unpaidFines.length}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.sp,
                                              color: Colors.grey.shade200,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      LocaleKeys.unpaid.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Row(
                                children: [
                                  Container(
                                    height: 30.h,
                                    width: 30.w,
                                    margin: EdgeInsets.only(right: 10.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                    child: Text(
                                      "${controller.paidFines.length}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.sp,
                                              color: Colors.grey.shade200,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      LocaleKeys.paid.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          onChanged: (value) => controller.selecChange(value!),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          const Spacer(),
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: TextButton(
                onPressed: () => Get.back(),
                child: const Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ),
                style: MyButtons.rounded(),
              ),
            ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
