import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'views/card_adder_screen.dart';
import 'views/card_item.dart';

class AuthTabCards extends GetView<HomeController> {
  const AuthTabCards({Key? key, required this.isChooseMode}) : super(key: key);
  final bool isChooseMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isChooseMode
          ? AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 30.w,
              title: Obx(
                () => Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      controller.cards.isEmpty
                          ? LocaleKeys.cardAdd.tr
                          : LocaleKeys.cardChoose.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: Obx(
        () {
          if (controller.cards.isEmpty) {
            return Spaces.horizontal(
              Center(
                child: Text(
                  controller.cards.isEmpty
                      ? LocaleKeys.cardAdd.tr
                      : LocaleKeys.cardChoose.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20.sp),
                ),
              ),
            );
          }
          return AlignedGridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 10.h,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            itemCount: controller.cards.length,
            crossAxisSpacing: 4,
            itemBuilder: (_, i) => GestureDetector(
              onTap: () => Get.back(result: controller.cards[i]),
              child: CardItem(
                card: controller.cards[i],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: "CardAdd",
        onPressed: () => Get.to(() => CardAdder()), //CardAdderScreen()),
        child: Icon(Icons.add),
      ),
    );
  }
}
