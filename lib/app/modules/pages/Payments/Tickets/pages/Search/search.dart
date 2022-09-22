import 'package:capar/app/modules/pages/Payments/Tickets/pages/Search/TabsView/AirPlane/airplane_ticket.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/pages/Search/TabsView/Bus/bus_ticket.dart';
import 'package:capar/app/modules/pages/Payments/Tickets/pages/Search/TabsView/Train/train_ticket.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SearchTicket extends StatefulWidget {
  const SearchTicket({Key? key}) : super(key: key);

  @override
  State<SearchTicket> createState() => _SearchTicketState();
}

class _SearchTicketState extends State<SearchTicket>
    with SingleTickerProviderStateMixin {
  int activeTabIndex = 1;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      initialIndex: 1,
      vsync: this,
    );
    controller.addListener(() {
      setState(() {
        activeTabIndex = controller.index;
      });
    });
  }

  Widget buttons(img, txt) {
    return Container(
      width: 85.w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        // color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: GestureDetector(
          child: Column(
            children: [
              SvgPicture.asset(
                img,
                height: 35.h,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                txt,
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Spaces.horizontal(
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                controller: controller,
                isScrollable: true,
                indicatorWeight: 0,
                labelPadding: const EdgeInsets.all(5),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  // color: Color(0xFFFBD59E)
                ),
                tabs: [
                  Container(
                    decoration: BoxDecoration(
                      color: activeTabIndex == 0
                          ? Theme.of(context).primaryColor
                          : Colors.orange,
                      // color: Color(0xFFC8E0DA),
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      // border:
                      //     Border.all(color: Colors.redAccent, width: 1)
                    ),
                    child: buttons(
                      MyAssetsImages.airPlaneIc,
                      LocaleKeys.airplane.tr,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: activeTabIndex == 1
                            ? Theme.of(context).primaryColor
                            : Colors.orange,
                        // color: Color(0xFFC8E0DA),
                        borderRadius: BorderRadius.all(Radius.circular(12.r))
                        // border:
                        //     Border.all(color: Colors.redAccent, width: 1)
                        ),
                    child: buttons(
                      MyAssetsImages.trainIc,
                      LocaleKeys.train.tr,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: activeTabIndex == 2
                            ? Theme.of(context).primaryColor
                            : Colors.orange,
                        // color: Color(0xFFC8E0DA),
                        borderRadius: BorderRadius.all(Radius.circular(12.r))
                        // border:
                        //     Border.all(color: Colors.redAccent, width: 1)
                        ),
                    child: buttons(
                      MyAssetsImages.busIc,
                      LocaleKeys.bus.tr,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: controller,
              children: [
                AirplaneTicket(),
                TrainTicket(),
                BusTicket(),
              ],
            ),
          ),
        ));
  }
}
