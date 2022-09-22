import 'package:capar/app/modules/controllers/ticket_controller.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainTicket extends StatefulWidget {
  const TrainTicket({Key? key}) : super(key: key);

  @override
  State<TrainTicket> createState() => _TrainTicketState();
}

class _TrainTicketState extends State<TrainTicket> {
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
  bool boolFrom = false;
  bool boolTo = false;
  String dateDeparture = '';
  String dateArrival = '';

  Widget textField(controller, icon, text, bool? enabled, type) {
    return Container(
      padding: EdgeInsets.all(2),
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
                    fromController,
                    Icon(Icons.train, color: Theme.of(context).primaryColor),
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
                      therdVariable = fromController.text;
                      fromController.text = toController.text;
                      toController.text = therdVariable;
                    });
                    print(toController.text);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                child: textField(
                    toController,
                    Icon(Icons.train_outlined,
                        color: Theme.of(context).primaryColor),
                    LocaleKeys.to.tr,
                    true,
                    TextInputType.text),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  controller.showDate(departureController);
                },
                child: textField(
                  departureController,
                  Icon(Icons.date_range, color: Theme.of(context).primaryColor),
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
                  controller.showDate(arrivalController);
                },
                child: textField(
                    arrivalController,
                    Icon(Icons.date_range,
                        color: Theme.of(context).primaryColor),
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
                    // controller.openBottomSheet();
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: passengerController,
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
}
