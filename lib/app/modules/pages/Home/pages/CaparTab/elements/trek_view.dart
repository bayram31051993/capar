import 'package:capar/app/modules/controllers/trek_controller.dart';
import 'package:capar/app/modules/pages/Home/pages/CaparTab/elements/trek_app_bar.dart';
import 'package:capar/app/modules/pages/Home/pages/CaparTab/elements/trek_number_item.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class TrekView extends GetView<TrekController> {
  const TrekView();

  @override
  Widget build(BuildContext context) {
    final _trekController = TextEditingController();
    TrekController controller = Get.put(TrekController());
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            TrackAppBar(),
            SizedBox(height: 30.h),
            Spaces.horizontal(
              Row(
                children: [
                  Expanded(
                    child: UIElements.simpleTextField(
                        type: enmTextFielType.trek,
                        textController: _trekController),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 50.h,
                    width: 45.w,
                    child: FloatingActionButton.extended(
                      heroTag: "trackNums",
                      isExtended: true,
                      onPressed: () =>
                          controller.addTrackNumber(_trekController.text),
                      label: SvgPicture.asset(MyAssetsImages.svgAdd),
                    ),
                  ),
                ],
              ),
            ),
            if (controller.tracksNumbers.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: controller.tracksNumbers.length,
                  itemBuilder: (ctx, i) {
                    return TeracNumberkItem(
                        trackNum: controller.tracksNumbers[i]);
                  },
                ),
              ),
            if (controller.tracksNumbers.isEmpty)
              Expanded(
                child: Center(
                  child: Spaces.horizontal(
                    Text(
                      LocaleKeys.trackTitle.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
