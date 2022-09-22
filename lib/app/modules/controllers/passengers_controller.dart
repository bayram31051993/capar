import 'dart:convert';

import 'package:capar/app/data/models/TicketsUserModel/tikcets_user_model.dart';
import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class PassengersController extends GetxController {
  final RxList<TicketPassengersModel> ticketPassengersModel =
      <TicketPassengersModel>[].obs;
  final Rx<TicketPassengersModel> passengerModel = TicketPassengersModel().obs;
  final isLoading = false.obs;

  @override
  onInit() {
    super.onInit();

    List<String>? all = PrvStorage().getListValues(enmStorageKeys.cardList);
    debugPrint('all $all');
    if (all != null && all.isNotEmpty) {
      for (var element in all) {
        final TicketPassengersModel cc =
            TicketPassengersModel.fromJson(json.decode(element));

        ticketPassengersModel.add(cc);
        debugPrint('credit card $cc');
      }
    }
  }

  deletCard(TicketPassengersModel passengersModels) {
    isLoading(true);
    ticketPassengersModel.remove(passengersModels);
    //await PrvDB.deleteRow('cards', card.id);
    var str = jsonEncode(passengersModels.toJson());
    PrvStorage().delFromList(enmStorageKeys.cardList, str);
    isLoading(false);
  }

  addCard(TicketPassengersModel passengersModels) {
    isLoading(true);
    passengersModels = Strings.pathPassenger(
        passengersModels.firstName,
        passengersModels.lstName,
        passengersModels.gender,
        passengersModels.bDate,
        passengersModels.docNum)['firstName'];
    ticketPassengersModel.add(passengersModels);
    var str = jsonEncode(passengersModels.toJson());
    PrvStorage().addToList(enmStorageKeys.passengers, str);
    isLoading(false);
  }

  addPassengersToList() {
    addCard(passengerModel.value);
    Get.back();
  }

  passengersUpdate(
      {String? fName,
      String? lName,
      String? bDay,
      String? gender,
      String? dNumber}) {
    passengerModel.update(
      (val) {
        if (num != null) {
          val!.firstName = fName!;
        }
        if (lName != null) {
          val!.lstName = lName;
        }
        if (bDay != null) {
          val!.bDate = bDay;
        }
        if (gender != null) {
          val!.gender = gender;
        }
        if (dNumber != null) {
          val!.docNum = dNumber;
        }
      },
    );
  }
}
