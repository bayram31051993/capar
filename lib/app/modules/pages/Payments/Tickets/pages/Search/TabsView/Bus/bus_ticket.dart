import 'package:capar/app/data/models/Ticket/get_bus_stations_model.dart'
    show Loc;
import 'package:capar/app/modules/controllers/ticket_controller.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/pages/Search/TabsView/Bus/bus_ticket_info.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class BusTicket extends StatefulWidget {
  const BusTicket({Key? key}) : super(key: key);

  @override
  State<BusTicket> createState() => _BusTicketState();
}

class _BusTicketState extends State<BusTicket> {
  TicketController controller = Get.put(TicketController());
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController departureController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();
  TextEditingController passengerController = TextEditingController();

  final GlobalKey<FormFieldState> fromKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> toKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> departureKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> arrivalKey = GlobalKey<FormFieldState>();

  // bool boolFrom = false;
  // bool boolTo = false;
  // String dateDeparture = '';
  // String dateArrival = '';
  @override
  void initState() {
    controller.autoCompleteBusRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          child: Container(
        margin: const EdgeInsets.all(2),
        child: Column(
          children: [
            switchWays(),
            SizedBox(
              height: 10.h,
            ),
            routesSelection(),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => BusTicketInfo(
                      departureController: departureController,
                      fromController: fromController,
                      toController: toController,
                      arrivalController: arrivalController),
                );
              },
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
      )),
    );
  }

  Container switchWays() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(137, 158, 151, 151),
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
      margin: EdgeInsets.only(top: 10.h),
      child: ToggleSwitch(
        cornerRadius: 8.r,
        minWidth: 137.w,
        initialLabelIndex: 0,
        activeBgColor: [Theme.of(context).primaryColor],
        customTextStyles: [
          TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.transparent,
        radiusStyle: true,
        labels: [LocaleKeys.one_way.tr, LocaleKeys.dep_ret.tr],
        onToggle: (index) {
          if (index == 0) {
            controller.ways(false);
          } else {
            controller.ways(true);
          }
        },
      ),
    );
  }

  Container routesSelection() {
    return Container(
      margin: const EdgeInsets.only(left: 7, right: 4),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
              child: TypeAheadField<Loc>(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: true,
                  controller: fromController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.directions_bus,
                        color: Theme.of(context).primaryColor),
                    labelText: LocaleKeys.from.tr,
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15.sp,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                  ),
                ),
                itemBuilder: (context, suggestion) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      suggestion.name.toString(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  );
                },
                suggestionsCallback: (pattern) async {
                  controller.autoCompleteBusRoute();
                  return controller.get_bus_stations_model.value.detail!.loc!
                      .where((element) => element.name == pattern);
                },
                onSuggestionSelected: (suggestion) {
                  fromController.text = suggestion.toString();
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: RawMaterialButton(
              fillColor: Theme.of(context).primaryColor,
              shape: const CircleBorder(),
              elevation: 0.0,
              child: Icon(
                Icons.swap_vert,
                color: Colors.white,
                size: 15.r,
              ),
              onPressed: () {
                String therdVariable = '';
                print("Text bool");
                setState(() {
                  therdVariable = fromController.text;
                  fromController.text = toController.text;
                  toController.text = therdVariable;
                });
                print(toController.text);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
              child: TypeAheadFormField<Loc>(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: true,
                  controller: toController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.directions_bus_outlined,
                        color: Theme.of(context).primaryColor),
                    labelText: LocaleKeys.to.tr,
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15.sp,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                  ),
                ),
                itemBuilder: (context, suggestion) {
                  return Text(
                    suggestion.name.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                },
                suggestionsCallback: (pattern) async {
                  controller.autoCompleteBusRoute();
                  return controller.get_bus_stations_model.value.detail!.loc!
                      .where((element) =>
                          element.name!.toLowerCase() == pattern.toLowerCase());
                },
                onSuggestionSelected: (suggestion) {
                  fromController.text = suggestion.name.toString();
                },
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: InkWell(
              onTap: () {
                controller.showDate(departureController);
              },
              child: TextFormField(
                enabled: false,
                controller: departureController,
                keyboardType: TextInputType.datetime,
                style: TextStyle(fontSize: 18.sp),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range,
                      color: Theme.of(context).primaryColor),
                  labelText: LocaleKeys.departure.tr,
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
            height: 10.h,
          ),
          Obx(
            () => Visibility(
              visible: controller.ways.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  enabled: false,
                  controller: arrivalController,
                  keyboardType: TextInputType.datetime,
                  style: TextStyle(fontSize: 18.sp),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range,
                        color: Theme.of(context).primaryColor),
                    labelText: LocaleKeys.arrival.tr,
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
          ),

          // Autocomplete<Loc>(
          //   optionsBuilder: (TextEditingValue textEditingValue) {
          //     if (textEditingValue.text.isEmpty) {
          //       return List.empty();
          //     }
          //     return controller.get_bus_stations_model.value.detail!.loc!
          //         .where((element) => element.name!
          //             .toLowerCase()
          //             .contains(textEditingValue.text.toLowerCase()))
          //         .toList();
          //   },
          //   displayStringForOption: (Loc d) => d.name!,
          //   onSelected: (value) => print(value),
          //   fieldViewBuilder: (BuildContext context,
          //       TextEditingController controller,
          //       FocusNode node,
          //       Function onSubmit) {
          //     return TextField(
          //       controller: fromController,
          //       focusNode: node,
          //       decoration: InputDecoration(
          //         prefixIcon: Icon(Icons.directions_bus_outlined,
          //             color: Theme.of(context).primaryColor),
          //         labelText: LocaleKeys.to.tr,
          //         labelStyle: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontSize: 15.sp,
          //         ),
          //         border: InputBorder.none,
          //         fillColor: Colors.transparent,
          //       ),
          //       style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
