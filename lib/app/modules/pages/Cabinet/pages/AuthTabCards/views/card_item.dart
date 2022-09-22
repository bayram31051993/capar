import 'package:capar/app/data/models/CardsModel/cards_model.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  final CreditCard card;
  const CardItem({Key? key, required this.card}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {},
      confirmDismiss: (direction) {
        return Get.defaultDialog<bool>(
          title: LocaleKeys.attention.tr,
          content: Text(LocaleKeys.delWarr.tr, textAlign: TextAlign.center),
          onCancel: () => Get.back<bool>(result: false),
          onConfirm: () {
            Get.find<HomeController>().deletCard(card);
            Get.back<bool>(result: true);
          },
        );
      },
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(card.image.isEmpty
                    ? MyAssetsImages.creditMock
                    : card.image)),
            borderRadius: BorderRadius.circular(5),
            boxShadow: MyPalette.bigItemShadow(),
          ),
          child: ClipRect(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 113.h),
                SizedBox(
                  height: 40.h,
                  child: Row(
                    children: [
                      SizedBox(width: 25.w),
                      Text(
                        card.number,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        card.expiredDate,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(width: 25.w)
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  child: Row(
                    children: [
                      SizedBox(width: 25),
                      Center(
                        child: Text(
                          card.cardHolder.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
