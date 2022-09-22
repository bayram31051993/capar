import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:capar/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommunalCheckAppBar extends StatelessWidget {
  final enmPaymentCommunal type;
  final Widget? table;
  final String? givenTitle;
  const CommunalCheckAppBar({required this.type, this.table, this.givenTitle});

  @override
  Widget build(BuildContext context) {
    var topH = MediaQuery.of(context).viewPadding.top;
    final title = Strings.titleOfCommunal(type).tr;
    // final balance = Get.find<InitializerController>().balance(type);
    var ht = topH + 85.h;
    // if (balance == null) {
    //   ht = topH + 70.h;
    // }
    if (table != null) {
      topH + 85.h;
    }
    return Container(
      width: double.infinity,
      height: ht,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35.r),
            bottomRight: Radius.circular(35.r),
          ),
          gradient: MyPalette.payItemCommunal(type),
          boxShadow: MyPalette.bannerShadow()),
      child: Column(
        children: [
          SizedBox(height: topH),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 20.w),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      givenTitle ?? title,
                      softWrap: false,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    // if (table == null && balance != null)
                    //   balance
                    // else
                    Center(child: table),
                  ],
                ),
              ),
              SizedBox(width: 30.w),
            ],
          ),
          SizedBox(height: 5.w),
        ],
      ),
    );
  }
}
