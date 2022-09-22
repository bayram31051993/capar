import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/pages/Cabinet/pages/InfoTabPayments/elements/info_item.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class InfoTabPayments extends GetView<HomeController> {
  const InfoTabPayments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: AlignedGridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 16.h,
        itemCount: enmPersonalInfo.values.length,
        itemBuilder: (context, i) {
          var type = enmTextFielType.values
              .byName(enmPersonalInfo.values.elementAt(i).name);

          return Obx(
            () {
              var content = "";

              if (type == enmTextFielType.nameField) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].frn
                        .toString()
                    : LocaleKeys.error.tr;
              } else if (type == enmTextFielType.surnameField) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].lsn
                        .toString()
                    : LocaleKeys.error.tr;
              } else if (type == enmTextFielType.carNumField) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].crn
                        .toString()
                    : LocaleKeys.error.tr;
              } else if (type == enmTextFielType.homeAddress) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].add
                        .toString()
                    : LocaleKeys.error.tr;
              } else if (type == enmTextFielType.homePhoneField) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].fon
                        .toString()
                    : LocaleKeys.error.tr;
              } else if (type == enmTextFielType.waterId) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].wid
                        .toString()
                    : LocaleKeys.error.tr;
              } else if (type == enmTextFielType.electroId) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].eid
                        .toString()
                    : LocaleKeys.error.tr;
              } else if (type == enmTextFielType.gazId) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].gid
                        .toString()
                    : LocaleKeys.error.tr;
              } else if (type == enmTextFielType.communalId) {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].cid
                        .toString()
                    : LocaleKeys.error.tr;
              } else {
                content = controller.cabinetInitialize.value.detail != null
                    ? controller.cabinetInitialize.value.detail!.loc![0].mob
                        .toString()
                    : LocaleKeys.error.tr;
              }
              return InfoItem(
                type: type,
                content: content,
              );
            },
          );
        },
      ),
    );
  }
}
