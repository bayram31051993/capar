import 'package:capar/app/modules/controllers/ticket_controller.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/pages/History/history_ticket.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/pages/Profile/profile.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/pages/Search/search.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketScreen extends GetView<TicketController> {
  TicketController ticketController = Get.put(TicketController());
  final _tabs = [SearchTicket(), HistoryTicket(), ProfileTicket()];
  enmPaymentType type;
  TicketScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
                  LocaleKeys.ticket.tr,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          body: _tabs[ticketController.selectedIndexTab.value],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: LocaleKeys.search.tr,
                icon: const Icon(Icons.airplane_ticket),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.tickets.tr,
                icon: const Icon(
                  Icons.history,
                ),
              ),
              BottomNavigationBarItem(
                label: LocaleKeys.passengers.tr,
                icon: const Icon(
                  Icons.person,
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
            currentIndex: ticketController.selectedIndexTab.value,
            onTap: (int i) => ticketController.selectedIndexTab(i),
          ),
        ));
  }
}
