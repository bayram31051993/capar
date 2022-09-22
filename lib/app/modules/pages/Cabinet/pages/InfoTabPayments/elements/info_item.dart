import 'package:capar/app/modules/pages/Cabinet/pages/InfoTabPayments/elements/info_updater.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InfoItem extends StatefulWidget {
  const InfoItem({
    Key? key,
    required this.type,
    required this.content,
  }) : super(key: key);
  final enmTextFielType type;
  final String content;

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  openInfo() => setState(() => _info = !_info);
  var _info = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          Get.to(() => InfoUpdater(widget.type));
          // if (widget.type == enmTextFielType.cellPhoneField) return;
          // if (widget.type == enmTextFielType.homePhoneField) {
          //   Get.to(() => HomeValidationScreen());
          // } else {
          //   Get.to(() => InfoUpdater(widget.type));
          // }
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
          decoration: BoxDecoration(
              color: Get.isDarkMode ? layerDark1 : Colors.white,
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: MyPalette.itemShadow()),
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          duration: Duration(milliseconds: 500),
          height: _info ? 125.h : 75.h,
          curve: Curves.fastLinearToSlowEaseIn,
          child: widget.type == enmTextFielType.cellPhoneField
              ? Row(
                  children: [
                    SizedBox(
                      child: Strings.iconData(enmTextFielType.cellPhoneField),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      widget.content,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Strings.iconData(widget.type) ??
                                      const SizedBox(),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Text(
                                      Strings.title(widget.type),
                                      softWrap: false,
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                widget.content.isEmpty
                                    ? "*****"
                                    : widget.content,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 15.sp),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60.w,
                          child: IconButton(
                            onPressed: () => openInfo(),
                            icon: Icon(
                              Icons.question_mark_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        )
                      ],
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: const SizedBox(),
                      secondChild: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 50.h,
                        child: Text(
                          Strings.description(widget.type),
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                          softWrap: true,
                        ),
                      ),
                      crossFadeState: _info
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      reverseDuration: Duration.zero,
                      sizeCurve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
