import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/Payments/Communication/communications_item.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommunicationScreen extends StatelessWidget {
  enmPaymentType type;
  CommunicationScreen(this.type);

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
              LocaleKeys.communication.tr,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 3),
            child: RefreshIndicator(
              child: Material(
                child: SizedBox(
                  width: 360.w,
                  height: 800.h,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        children: [
                          ...enmPaymetnComunication.values.map(
                            (e) {
                              // if (e == enmPaymentType.capar) {
                              //   return CaparTab();
                              // }
                              return CommunicationsItem(
                                  e, enmPaymetnComunication.values.indexOf(e));
                            },
                          ).toList()
                        ],
                      )),
                ),
              ),
              onRefresh: () => Get.find<InitializerController>().loadInitials(),
            ),
          )
        ],
      ),
    );
  }
}
