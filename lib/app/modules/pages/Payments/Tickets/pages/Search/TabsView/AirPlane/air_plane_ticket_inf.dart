import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class AirTicketInfo extends StatefulWidget {
  AirTicketInfo({Key? key}) : super(key: key);

  @override
  State<AirTicketInfo> createState() => _AirTicketInfoState();
}

class _AirTicketInfoState extends State<AirTicketInfo> {
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
              LocaleKeys.ticket.tr,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      body: Spaces.horizontal(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
          child: Card(
            elevation: 4.0,
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
