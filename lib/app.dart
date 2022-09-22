import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/app/modules/bindings/initializer_binding.dart';
import 'package:capar/app/routes/app_pages.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'core/apperience/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locals = PrvStorage().getLocal();
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Çapar",
            initialBinding: InitializerBinding(),
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            translations: AppTranslation(),
            locale: Locale(locals.split('_')[0], locals.split('_')[1]),
            themeMode: PrvStorage().getThemeMode(),
            theme: FlexColorScheme.light(
              colors: caparColorSchame.light,
              appBarStyle: FlexAppBarStyle.surface,
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontFamily: 'Arial', overflow: TextOverflow.fade),
                  bodyText2: TextStyle(
                      fontFamily: 'Arial', overflow: TextOverflow.fade),
                  headline6: TextStyle(
                      fontFamily: 'Arial', overflow: TextOverflow.fade)),
            ).toTheme,
            darkTheme: FlexColorScheme.dark(
              colors: caparColorSchame.dark,
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              textTheme: const TextTheme(
                bodyText1:
                    TextStyle(fontFamily: 'Arial', overflow: TextOverflow.fade),
                bodyText2:
                    TextStyle(fontFamily: 'Arial', overflow: TextOverflow.fade),
                headline6:
                    TextStyle(fontFamily: 'Arial', overflow: TextOverflow.fade),
              ),
            ).toTheme,
          );
        });
  }
}
