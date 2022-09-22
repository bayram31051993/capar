import 'package:capar/app/data/models/TicketsUserModel/tikcets_user_model.dart';
import 'package:capar/app/modules/controllers/passengers_controller.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/pages/Profile/add_passengers.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'passengers_info.dart';

class ProfileTicket extends StatelessWidget {
  const ProfileTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Get.put(PassengersController()).ticketPassengersModel.isEmpty
          ? Container()
          : AlignedGridView.count(
              crossAxisCount: 1,
              mainAxisSpacing: 10.h,
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              itemCount:
                  Get.put(PassengersController()).ticketPassengersModel.length,
              crossAxisSpacing: 4,
              itemBuilder: (_, i) => GestureDetector(
                onTap: () {
                  navigationDetail(
                    // elemente basan yagdayda
                    Get.put(PassengersController()).ticketPassengersModel[i],
                    LocaleKeys.editPassengers.tr,
                  );
                },
                child: PassengersInfo(
                    passengersModel: Get.put(PassengersController())
                        .ticketPassengersModel[i]),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          navigationDetail(
              TicketPassengersModel(
                  firstName: '',
                  lstName: '',
                  bDate: '',
                  docNum: '',
                  gender: ''),
              LocaleKeys.addPassengers.tr);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void navigationDetail(
      TicketPassengersModel model, String appBarTittle) async {
    bool result = await Get.to(() => AddPassengers(model, appBarTittle));
    if (result == true) {
      // updateListView();
    }
  }
}
