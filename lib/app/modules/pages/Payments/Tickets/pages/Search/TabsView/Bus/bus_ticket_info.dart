import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BusTicketInfo extends StatelessWidget {
  BusTicketInfo({
    Key? key,
    required this.departureController,
    required this.fromController,
    required this.toController,
    required this.arrivalController,
  }) : super(key: key);
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController departureController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              LocaleKeys.departure.tr,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      body: Spaces.horizontal(
        SizedBox(
          height: 150.h,
          child: Column(
            children: [
              Card(
                elevation: 2.0,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            LocaleKeys.departure.tr,
                            style: GoogleFonts.montserrat(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            departureController.text + ", 8:00",
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            LocaleKeys.from.tr,
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            fromController.text,
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_bus,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            "8 sag 50 min",
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            LocaleKeys.arrival.tr,
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            departureController.text + ", 16:00",
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            LocaleKeys.to.tr,
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            toController.text,
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
