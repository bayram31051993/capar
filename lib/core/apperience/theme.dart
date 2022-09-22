import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/enums.dart';
import '../values/globals.dart';

const FlexSchemeData caparColorSchame = FlexSchemeData(
  name: 'Toledo purple',
  description: 'Purple theme created from custom defined colors.',
  light: FlexSchemeColor(
    error: error,
    primary: primary,
    primaryVariant: primaryVariant,
    secondary: secondary,
    secondaryVariant: secondaryVariant,
  ),
  dark: FlexSchemeColor(
    error: errorDark,
    primary: primaryDark,
    primaryVariant: primaryVariantDark,
    secondary: secondaryDark,
    secondaryVariant: secondaryVariantDark,
  ),
);

const genericGradient = [
  Color(0xffBCDFFF),
  Color(0xffFFE9BD),
  Color(0xffC9FCC4),
  Color(0xffFFD8EB),
  Color(0xffFFE9BD),
  Color(0xffC9FCC4),
  Color(0xffFFD8EB),
  Color(0xffFFE5B5),
  Color(0xffD4D3FF),
  Color(0xffFFE9BD),
  Color(0xffDDF3FF),
  Color(0xffBCDFFF),
  Color(0xffFFE9BD),
  Color(0xffC9FCC4),
  Color(0xffFFD8EB),
  Color(0xffFFE9BD),
  Color(0xffC9FCC4),
  Color(0xffFFD8EB),
  Color(0xffFFE5B5),
  Color(0xffD4D3FF),
  Color(0xffFFE9BD),
  Color(0xffDDF3FF),
];

const genericGradientDark = [
  Color.fromARGB(255, 100, 120, 138),
  Color.fromARGB(255, 126, 114, 91),
  Color.fromARGB(255, 104, 131, 102),
  Color.fromARGB(255, 134, 111, 122),
  Color.fromARGB(255, 129, 118, 95),
  Color.fromARGB(255, 88, 114, 86),
  Color.fromARGB(255, 131, 107, 119),
  Color.fromARGB(255, 129, 116, 91),
  Color.fromARGB(255, 95, 94, 117),
  Color.fromARGB(255, 128, 115, 90),
  Color.fromARGB(255, 100, 120, 138),
  Color.fromARGB(255, 126, 114, 91),
  Color.fromARGB(255, 104, 131, 102),
  Color.fromARGB(255, 134, 111, 122),
  Color.fromARGB(255, 129, 118, 95),
  Color.fromARGB(255, 88, 114, 86),
  Color.fromARGB(255, 131, 107, 119),
  Color.fromARGB(255, 129, 116, 91),
  Color.fromARGB(255, 95, 94, 117),
  Color.fromARGB(255, 128, 115, 90),
];

class MyPalette {
  static List<BoxShadow> bannerShadow() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 10.r,
        blurRadius: 40.r,
        offset: const Offset(-5, 5),
        // changes position of shadow
      ),
    ];
  }

  static List<BoxShadow> bigItemShadow() {
    return [
      BoxShadow(
        offset: const Offset(1, 2),
        color: Colors.black.withOpacity(0.3),
        blurRadius: 15,
        spreadRadius: 5,
      )
    ];
  }

  static List<BoxShadow> itemShadow() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 5.r,
        blurRadius: 20.r,
        offset: const Offset(-5, 5),
        // changes position of shadow
      ),
    ];
  }

  static Gradient payItemcColorPYGG(enmPaymentType type) {
    Gradient color;
    switch (type) {
      case enmPaymentType.pygg:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 173, 206, 199),
            Color.fromARGB(255, 208, 196, 221),
          ],
        );
        break;
      default:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.transparent,
            Colors.transparent,
          ],
        );
    }
    return color;
  }

  static Gradient payItemCommunal(enmPaymentCommunal type) {
    Gradient color;
    switch (type) {
      case enmPaymentCommunal.water:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 178, 207, 230),
            Color.fromARGB(255, 162, 198, 228),
          ],
        );
        break;
      case enmPaymentCommunal.electro:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 221, 203, 168),
            Color.fromARGB(255, 224, 212, 156),
          ],
        );
        break;
      case enmPaymentCommunal.utils:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 171, 176, 214),
            Color.fromARGB(255, 233, 194, 235),
          ],
        );
        break;
      default:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.transparent,
            Colors.transparent,
          ],
        );
    }
    return color;
  }

  static Gradient payItemMedia(enmPaymentMedia type) {
    Gradient color;
    switch (type) {
      case enmPaymentMedia.agtsIpTv:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 190, 158, 158),
            Color.fromARGB(226, 175, 174, 228),
          ],
        );
        break;
      case enmPaymentMedia.cabelTV:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 190, 158, 158),
            Color.fromARGB(226, 175, 174, 228),
          ],
        );
        break;
      default:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.transparent,
            Colors.transparent,
          ],
        );
    }
    return color;
  }

  static Gradient payItemsColor(enmPaymetnComunication type) {
    Gradient color;
    switch (type) {
      // case enmPaymentType.capar:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Theme.of(Get.context!).primaryColor,
      //       Color.fromARGB(255, 145, 110, 241),
      //       Color.fromARGB(255, 193, 163, 233),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.pygg:
      //   color = const LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 173, 206, 199),
      //       Color.fromARGB(255, 208, 196, 221),
      //     ],
      //   );
      //   break;
      case enmPaymetnComunication.tmTelekom:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 218, 185, 223),
            Color.fromARGB(255, 171, 172, 212),
          ],
        );
        break;
      case enmPaymetnComunication.tmCell:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 147, 178, 224),
            Color.fromARGB(255, 221, 187, 241),
          ],
        );
        break;
      case enmPaymetnComunication.agtsInternet:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 183, 172, 228),
            Color.fromARGB(255, 162, 197, 211),
          ],
        );
        break;
      case enmPaymetnComunication.agtsTelefon:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 163, 187, 223),
            Color.fromARGB(255, 169, 207, 214),
          ],
        );
        break;
      // case enmPaymentType.agtsIpTv:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 190, 158, 158),
      //       Color.fromARGB(226, 175, 174, 228),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.telecomTV:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 190, 158, 158),
      //       Color.fromARGB(226, 175, 174, 228),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.water:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 178, 207, 230),
      //       Color.fromARGB(255, 162, 198, 228),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.electro:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 221, 203, 168),
      //       Color.fromARGB(255, 224, 212, 156),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.utils:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 171, 176, 214),
      //       Color.fromARGB(255, 233, 194, 235),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.ticket:
      // color = const LinearGradient(
      //   begin: Alignment.bottomLeft,
      //   end: Alignment.topRight,
      //   colors: [
      //     Color.fromARGB(255, 163, 187, 223),
      //     Color.fromARGB(255, 169, 207, 214),
      //   ],
      // );
      // break;
      // case enmPaymentType.suw_tut:
      //   color = const LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 190, 158, 158),
      //       Color.fromARGB(226, 175, 174, 228),
      //     ],
      //   );
      // break;

      // case enmPaymentType.telecomTV:
      // color = LinearGradient(
      //   begin: Alignment.bottomLeft,
      //   end: Alignment.topRight,
      //   colors: [
      //     Color.fromARGB(255, 171, 176, 214),
      //     Color.fromARGB(255, 233, 194, 235),
      //   ],
      // );
      // break;
      // case enmPaymentType.cabelTV:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 172, 171, 223),
      //       Color.fromARGB(255, 231, 188, 199),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.student:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 166, 162, 199),
      //       Color.fromARGB(255, 171, 214, 212),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.licese:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 221, 207, 179),
      //       Color.fromARGB(255, 216, 208, 178),
      //     ],
      //   );
      //   break;
      // case enmPaymentType.migration:
      //   color = LinearGradient(
      //     begin: Alignment.bottomLeft,
      //     end: Alignment.topRight,
      //     colors: [
      //       Color.fromARGB(255, 220, 177, 221),
      //       Color.fromARGB(255, 231, 170, 170),
      //     ],
      //   );
      //   break;
      default:
        color = const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.transparent,
            Colors.transparent,
          ],
        );
    }
    return color;
  }
}
