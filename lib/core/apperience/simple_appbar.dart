import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({Key? key, required this.title, this.onBack})
      : super(key: key);
  final String title;
  final Function()? onBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      //titleSpacing: 20.w,
      title: Row(
        children: [
          SizedBox(width: 5.w),
          IconButton(
            onPressed: onBack ?? () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
