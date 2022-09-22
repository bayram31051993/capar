import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:capar/app/data/api/Ticket/ticket_post.dart';
import 'package:capar/app/data/models/Ticket/get_bus_stations_model.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/values/styles.dart';

class TicketController extends GetxController {
  final selectedIndexTab = 0.obs;
  var dateString = '';
  var afterDateSplit = '';
  final adult = 0.obs;
  final child = 0.obs;
  final babies = 0.obs;
  final isLoading = false.obs;
  final autoComplete = ''.obs;
  final ways = false.obs;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController departureController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();
  TextEditingController passengerController = TextEditingController();
  Rx<GetBusStationsModel> get_bus_stations_model = GetBusStationsModel().obs;
  GetBusStationsModel? getBusStationsModel;
  TicketPost ticketPost = TicketPost();
  List<Loc>? routes;
  final List testTickets = [
    'Ashgabat',
    'Turkmenabat',
    'Balakanat',
    'Mary',
    'Dashoguz',
    'Turkmenbashy'
  ];

  showDate(TextEditingController dateText) {
    showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
        currentDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
                accentColor: Colors.black45,
                backgroundColor: Colors.lightBlue,
                cardColor: Colors.white,
              ),
            ),
            child: child!,
          );
        }).then((date) {
      dateString = DateFormat.yMMMd().format(date!);
      dateText.text = dateString.replaceAll('-', '/');
    });
  }

  chooseBrithDay(TextEditingController dateText) {
    showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2050),
        currentDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
                accentColor: Colors.black45,
                backgroundColor: Colors.lightBlue,
                cardColor: Colors.white,
              ),
            ),
            child: child!,
          );
        }).then((date) {
      dateString =
          DateFormat('dd/MM/yyyy').format(date!).toString().split(' ')[0];
      dateText.text = dateString.replaceAll('-', '/');
    });
  }

  void updateCount(item) {
    item++;
  }

  @override
  void onInit() {
    autoCompleteBusRoute();
    super.onInit();
  }

  void removeCount(item) {
    if (item != 0) {
      item--;
    }
  }

  autoCompleteBusRoute() async {
    isLoading(true);
    var response = await ticketPost.getbusstations();
    if (response != null) {
      get_bus_stations_model.value = response;
      // get_bus_stations_model.value.detail!.loc!
      //     .where((element) => element.name!.toLowerCase().contains())
      //     .toList();
    }
    isLoading(false);
  }

  waysFunc() {
    if (ways.isFalse) {
      ways(true);
    } else {
      ways(false);
    }
  }
}
