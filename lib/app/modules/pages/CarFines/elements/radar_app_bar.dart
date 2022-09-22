import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RadarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RadarAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(60.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 20.w,
      title: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text(
            LocaleKeys.fraffFinesPay.tr,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
