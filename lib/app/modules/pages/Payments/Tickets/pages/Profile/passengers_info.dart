import 'package:capar/app/data/models/TicketsUserModel/tikcets_user_model.dart';
import 'package:capar/app/modules/controllers/passengers_controller.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PassengersInfo extends StatelessWidget {
  final TicketPassengersModel passengersModel;
  const PassengersInfo({Key? key, required this.passengersModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "${passengersModel.firstName} ${passengersModel.lstName}",
              style: GoogleFonts.montserrat(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Icon(
              Icons.document_scanner,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              passengersModel.docNum.toString(),
              style: GoogleFonts.montserrat(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              passengersModel.bDate.toString(),
              style: GoogleFonts.montserrat(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: 10.h,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Get.put(PassengersController()).deletCard(passengersModel);
              },
              child: Text(
                LocaleKeys.delete.tr,
                style: GoogleFonts.montserrat(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
