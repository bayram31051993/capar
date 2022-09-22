import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/pages/Cabinet/elements/cabiet_app_bar.dart';
import 'package:capar/app/modules/pages/Cabinet/pages/AuthCouriers/auth_tab_couriers.dart';
import 'package:capar/app/modules/pages/Cabinet/pages/AuthTabCards/auth_tab_cards.dart';
import 'package:capar/app/modules/pages/Cabinet/pages/AuthTabPayments/auth_tab_payments.dart';
import 'package:capar/app/modules/pages/Cabinet/pages/InfoTabPayments/info_tab_payments.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CabinetView extends GetView<HomeController> {
  CabinetView();
  final _tabs = [
    InfoTabPayments(),
    AuthTabCards(
      isChooseMode: false,
    ),
    AuthTabPayments(),
    AuthTabCouriers(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CabinetAppBar(),
        body: _tabs[controller.selectedIndexTab.value],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: LocaleKeys.info.tr,
              icon: const Icon(Icons.info),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.cards.tr,
              icon: const Icon(
                Icons.credit_card,
              ),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.payments.tr,
              icon: const Icon(
                Icons.payments_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.calls.tr,
              icon: Icon(
                Icons.delivery_dining,
              ),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).primaryColor,
          selectedIconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.secondary, size: 27.h),
          unselectedIconTheme: IconThemeData(color: Colors.grey.shade200),
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey.shade200,
          currentIndex: controller.selectedIndexTab.value,
          onTap: (int i) => controller.selectedIndexTab(i),
        ),
      ),
    );
  }
}
