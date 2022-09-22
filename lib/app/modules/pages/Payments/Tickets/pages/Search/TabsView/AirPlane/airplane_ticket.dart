import 'package:auto_size_text/auto_size_text.dart';
import 'package:capar/app/modules/controllers/ticket_controller.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/pages/Search/TabsView/bottom_sheet_ticket.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AirplaneTicket extends StatefulWidget {
  const AirplaneTicket({Key? key}) : super(key: key);

  @override
  State<AirplaneTicket> createState() => _AirplaneTicketState();
}

class _AirplaneTicketState extends State<AirplaneTicket> {
  TicketController controller = Get.put(TicketController());

  final GlobalKey<FormFieldState> fromKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> toKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> departureKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> arrivalKey = GlobalKey<FormFieldState>();

  // bool boolFrom = false;
  // bool boolTo = false;

  // String dateDeparture = '';
  // String dateArrival = '';

  Widget textField(controller, icon, suffixIcon, text, bool? enabled, type) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      child: TextFormField(
        enabled: enabled,
        keyboardType: type,
        controller: controller,
        style: TextStyle(fontSize: 18.sp),
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          labelText: text,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 15.sp,
          ),
          border: InputBorder.none,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Container(
          margin: EdgeInsets.all(2),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
                child: textField(
                    controller.fromController,
                    Icon(Icons.flight_takeoff,
                        color: Theme.of(context).primaryColor),
                    DropdownButton(
                      underline: const SizedBox(),
                      onChanged: (String? changedValue) {
                        setState(() {
                          controller.fromController.text = changedValue!;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down,
                          color: Theme.of(context).primaryColor),
                      items: controller.testTickets.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    LocaleKeys.from.tr,
                    true,
                    TextInputType.text),
              ),
              SizedBox(
                width: 40.w,
                height: 40.h,
                child: RawMaterialButton(
                  fillColor: Theme.of(context).primaryColor,
                  shape: const CircleBorder(),
                  elevation: 0.0,
                  child: Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                    size: 20.r,
                  ),
                  onPressed: () {
                    String therdVariable = '';
                    print("Text bool");
                    setState(() {
                      therdVariable = controller.fromController.text;
                      controller.fromController.text =
                          controller.toController.text;
                      controller.toController.text = therdVariable;
                    });
                    print(controller.toController.text);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                child: textField(
                    controller.toController,
                    Icon(Icons.flight_land,
                        color: Theme.of(context).primaryColor),
                    DropdownButton(
                      // isExpanded: true,
                      underline: const SizedBox(),
                      onChanged: (String? changedValue) {
                        setState(() {
                          controller.toController.text = changedValue!;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down,
                          color: Theme.of(context).primaryColor),
                      items: controller.testTickets.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    LocaleKeys.to.tr,
                    true,
                    TextInputType.text),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  controller.showDate(controller.departureController);
                },
                child: textField(
                  controller.departureController,
                  Icon(Icons.date_range, color: Theme.of(context).primaryColor),
                  const Icon(
                    Icons.hourglass_empty,
                    color: Colors.transparent,
                  ),
                  LocaleKeys.departure.tr,
                  false,
                  TextInputType.datetime,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  controller.showDate(controller.arrivalController);
                },
                child: textField(
                    controller.arrivalController,
                    Icon(Icons.date_range,
                        color: Theme.of(context).primaryColor),
                    const Icon(
                      Icons.hourglass_empty,
                      color: Colors.transparent,
                    ),
                    LocaleKeys.arrival.tr,
                    false,
                    TextInputType.datetime),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    openBottomSheet();
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: controller.passengerController,
                    style: TextStyle(fontSize: 18.sp),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.r,
                            ),
                          ),
                          onPressed: () {
                            // print("Somthing");
                            // controller
                            //     .openBottomSheet(passengersItem.toString());
                          }),
                      prefixIcon: Icon(Icons.person,
                          color: Theme.of(context).primaryColor),
                      labelText: LocaleKeys.passenger.tr,
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15.sp,
                      ),
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  LocaleKeys.search.tr,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openBottomSheet() async {
    showBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        builder: (context) {
          return BottomSheetTicket();
        });
  }
}
