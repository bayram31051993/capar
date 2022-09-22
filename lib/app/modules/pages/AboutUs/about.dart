import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/values/assets.dart';
import '../../../../generated/locales.g.dart';
import 'elements/link_item.dart';

class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'contact@turkmenpost.gov.tm',
      query: encodeQueryParameters(<String, String>{'subject': 'Çapar barada'}),
    );
    final init = Get.find<InitializerController>().initializer.value;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //titleSpacing: 20.w,
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
              LocaleKeys.aboutP.tr,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                LinkItem(
                  url: 'https://turkmenpost.gov.tm/',
                  iconPath: MyAssetsImages.svgHome,
                  title: LocaleKeys.mainP.tr,
                  index: 1,
                ),
                LinkItem(
                  url: 'https://turkmenpost.gov.tm/contact',
                  iconPath: MyAssetsImages.svgContacts,
                  title: LocaleKeys.contactP.tr,
                  index: 2,
                ),
                LinkItem(
                  url: 'https://turkmenpost.gov.tm/tarif',
                  iconPath: MyAssetsImages.svgRate,
                  title: LocaleKeys.tariffs.tr,
                  index: 3,
                ),
                LinkItem(
                  url: 'https://turkmenpost.gov.tm/about',
                  iconPath: MyAssetsImages.svgAbout,
                  title: LocaleKeys.aboutP.tr,
                  index: 4,
                ),
              ],
            ),
          ),
          // SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            height: 50.h,
            width: double.infinity,
            child: FloatingActionButton.extended(
              heroTag: "num",
              isExtended: true,
              onPressed: () => launch("tel://${init.detail!.loc![0].sup}"),
              label: Row(
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  SizedBox(width: 10.w),
                  Text(
                    init.detail != null
                        ? init.detail!.loc![0].sup.toString()
                        : "",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade200),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            height: 50.h,
            width: double.infinity,
            child: FloatingActionButton.extended(
              heroTag: "mail",
              isExtended: true,
              onPressed: () => launch(emailLaunchUri.toString()),
              label: Row(
                children: [
                  Icon(Icons.email, color: Colors.white),
                  SizedBox(width: 10.w),
                  FittedBox(
                    child: Text(
                      "contact@turkmenpost.gov.tm",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 15.sp, color: Colors.grey.shade200),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
