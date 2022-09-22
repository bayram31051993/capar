import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/AboutUs/about.dart';
import 'package:capar/app/modules/pages/Cabinet/elements/cabinet_view.dart';
import 'package:capar/app/routes/app_pages.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/enums.dart';

class WwDrawer extends StatefulWidget {
  const WwDrawer({Key? key}) : super(key: key);
  @override
  State<WwDrawer> createState() => _WwDrawerState();
}

class _WwDrawerState extends State<WwDrawer> {
  onChanged() {
    PrvStorage().changeThemeMode();
    Get.find<InitializerController>().isDark.value =
        PrvStorage().isSavedDarkmode();
  }

  var _index = 0;
  final List _locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'РУССКИЙ', 'locale': const Locale('ru', 'RU')},
    {'name': 'TÜRKMEN', 'locale': const Locale('tk', 'TM')},
  ];
  @override
  void initState() {
    super.initState();
    final cur = PrvStorage().getLocal();
    _index = curLocla(cur);
  }

  int curLocla(String cl) {
    var rez = 0;
    switch (cl) {
      case 'en_US':
        rez = 0;
        break;
      case 'ru_RU':
        rez = 1;
        break;
      case 'tk_TM':
        rez = 2;
        break;
      default:
    }
    return rez;
  }

  updateLanguage(Locale locale) {
    PrvStorage()
        .saveValue(enmStorageKeys.local, _locale[_index]['locale'].toString());
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    var statusHeight = MediaQuery.of(context).viewPadding.top;
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 15.sp,
        );
    return SizedBox(
      width: 265.w,
      child: Drawer(
        child: ListTileTheme(
          iconColor: Theme.of(context).colorScheme.primary,
          style: ListTileStyle.drawer,
          child: Column(
            children: [
              SizedBox(height: statusHeight),
              SizedBox(
                height: 30.h,
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.close),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () => onChanged(),
                      icon: Get.isDarkMode
                          ? Icon(Icons.wb_sunny, color: Colors.grey.shade200)
                          : Icon(Icons.dark_mode_rounded),
                    ),
                    SizedBox(width: 10.w)
                  ],
                ),
              ),
              Container(
                width: 140.w,
                height: 140.h,
                margin: EdgeInsets.only(
                  top: 10.h,
                  bottom: 30.h,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(Get.isDarkMode
                      ? "assets/images/app_icon_d.png"
                      : "assets/images/app_icon.png"),
                ),
              ),
              Expanded(
                child: Spaces.horizontal(
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListTile(
                        onTap: () => Get.to(() => CabinetView()),
                        leading: const Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 238, 159, 41),
                        ),
                        title: Text(
                          LocaleKeys.cabinet.tr,
                          style: style,
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(MyAssetsImages.svgLanguages,
                            height: 20.h),
                        title: DropdownButton<int>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: Icon(Icons.expand_more_rounded,
                              color: Theme.of(context).colorScheme.secondary),
                          style: style,
                          value: _index,
                          items: [
                            DropdownMenuItem(
                              child: Text(_locale[0]['name']),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text(_locale[1]['name']),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text(_locale[2]['name']),
                              value: 2,
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              _index = value!;
                              updateLanguage(_locale[_index]['locale']);
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () => Get.toNamed(Routes.departmets),
                        leading: SvgPicture.asset(MyAssetsImages.svgDepartments,
                            height: 20.h),
                        title: Text(LocaleKeys.departs.tr, style: style),
                      ),
                      ListTile(
                        onTap: () => Get.to(() => AboutUs()),
                        leading: SvgPicture.asset(MyAssetsImages.svgAbout,
                            height: 27.h),
                        title: Text(LocaleKeys.aboutP.tr, style: style),
                      ),
                      Divider(
                        color: Get.isDarkMode
                            ? Colors.grey.shade200
                            : Colors.black54,
                        endIndent: 10,
                        indent: 20,
                      ),
                      ListTile(
                        onTap: () {
                          launch(
                              "https://play.google.com/store/apps/details?id=tm.gov.turkmenpost.caparpay&hl=en&gl=US");
                        },
                        leading: SvgPicture.asset(MyAssetsImages.svgStar,
                            height: 27.h),
                        title: Text(LocaleKeys.rateUs.tr, style: style),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 40.h,
                              child: Image.asset(
                                'assets/images/splash_logo_2.png',
                                fit: BoxFit.contain,
                              )),
                          SizedBox(width: 10.w),
                          DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12.sp),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 16.h,
                              ),
                              child: FutureBuilder<PackageInfo>(
                                future: PackageInfo.fromPlatform(),
                                builder: (_, snap) {
                                  if (snap.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text(
                                        LocaleKeys.version.tr + ': 0.0.0');
                                  } else {
                                    return Text(LocaleKeys.version.tr +
                                        ': ' +
                                        snap.data!.version);
                                  }
                                },
                              ),
                            ),
                          ),
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
