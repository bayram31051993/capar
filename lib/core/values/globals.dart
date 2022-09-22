// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import '../utils/enums.dart';
import 'assets.dart';

const greenGlobal = Color.fromRGBO(131, 184, 40, 1);
const error = Color.fromRGBO(255, 80, 80, 1);
const primary = Color.fromRGBO(102, 101, 255, 1);
const primaryVariant = Color.fromARGB(255, 64, 64, 207);
const secondary = Color.fromRGBO(255, 172, 47, 1);
const secondaryVariant = Color.fromARGB(255, 180, 122, 34);

const errorDark = Color.fromARGB(255, 241, 117, 117);
const primaryDark = Color.fromARGB(255, 115, 115, 241);
const primaryVariantDark = Color.fromARGB(255, 71, 71, 165);
const secondaryDark = Color.fromARGB(255, 224, 167, 80);
const secondaryVariantDark = Color.fromARGB(255, 206, 148, 62);

const paddind = EdgeInsets.all(16.0);

const boxLight = Color.fromRGBO(217, 232, 255, 1);
const boxLight2 = Color(0xFFF8F8F8);
const rowLight = Color.fromRGBO(242, 242, 255, 1);
const layerDark1 = Color.fromRGBO(36, 36, 36, 1);
const layerDark2 = Color.fromRGBO(61, 61, 61, 1);

const app = 'capar.turkmenpost';

const baseCaparUrl = "https://dev.post.tm";
const getUserSmsCode = "https://dev.post.tm/v2/auth/register";
const confirm_sms = "https://dev.post.tm/v2/auth/confirm-sms";
const login_acces_toke_url = "${baseCaparUrl}/v2/auth/login";
const who_i_am = "https://dev.post.tm/v2/user/me";
String getInitUrl =
    "$baseCaparUrl/v2/user/init?ts=${DateTime.now().millisecondsSinceEpoch}";
const update_user_info = "${baseCaparUrl}/v2/user/info";
const getAllFines = '${baseCaparUrl}/v1/info/pygg/';
const getBusStantionsUrl = "${baseCaparUrl}/v1/pay/bus-stations";
const uRLConfirmCapcha = 'https://capar.turkmenpost.gov.tm/api/confirm-gts/';
const uRLGTSCabinet = 'https://my.agts.tv/securimage/securimage_show.php?';
const bankProcessFormUrl = "https://mpi.gov.tm/payment/rest/processform.do";
const bankSmsUrl = "https://acs.gov.tm/acs/pages/enrollment/authentication.jsf";

// const initUrl = "/get-info/init";
// const welURL = "/get-info/states";
// const cityURL = '/get-info/cities';

// ACC_ACTN        = 'actn'        # 0
// ACC_ELECTRO     = 'electro'     # 1
// ACC_GAS         = 'gas'         # 2
// ACC_HEATING     = 'heating'     # 3
// ACC_LIVEAREA    = 'livearea'    # 4
// ACC_MORTAGE     = 'mortage'     # 5
// ACC_PYGG        = 'pygg'        # 6
// ACC_TELECOM     = 'telecom'     # 7
// ACC_TMCELL      = 'tmcell'      # 8
// ACC_WATER       = 'water'       # 9
// ACC_UTILITIES   = 'utilities'   # 10
// ACC_EMS         = 'ems'         # 11
// ACC_POST        = 'post'        # 12
// ACC_CAPAR       = 'capar'       # 13
// ACC_ABUNA       = 'abuna'       # 14
// ACC_ACTN_INET   = 'actn_in'     # 15
// ACC_ACTN_IPTV   = 'actn_ip'     # 16
// ACC_CAVLETV     = 'cabletv'     # 17

const uRLCallCreate = "call-create";
const uRLOrderStates = "order-states/";
const uRLDepartmentList = "departments";
const uRLVerifySmsPaymentCall = "/api/verify-pygg-sms/";
const uRLGetUtilities = "get-info/apartments";

const paymentTypeBankSenagat = "bank/senagat";
const paymentTypeBankRysgal = "bank/rysgal";
const paymentTypeBankHalkbank = "bank/halkbank";
const paymentTypeBankMillicart = "bank/vnesh";
const paymentTypeMobile = "mobile";
const paymentTypeCash = "cash";
const airlinesWebUrl = 'https://turkmenistanairlines.tm/';
const trainWebUrl = "https://railway.gov.tm/";

const paymentMethodPYGG = "pay-pygg";
const paymentMethodTelecom = "pay-telekom";
const paymentMethodTmCell = "pay-tmcell";
const paymentMethodGTS = "pay-gts";
const paymentMethodPublicUtils = 'pay-apartment';
const paymentMethodPublicUtilsManual = 'pay-public-utilities';
const payCableTV = "pay-cabel";

const uRLHalkbankDirectPaymentRequest = "hb-direct-payment/";
const uRLHalkbankDirectPaymentCheckSms = "hb-check-sms/";

const uRLSmsLoginInit = "token/sms-init";
const uRLSmsLoginDo = "token/sms-login";

const uRLJerimeler = "https://post.tm/laws/";

final tabs = [
  LocaleKeys.courier,
  LocaleKeys.payments,
  LocaleKeys.radar,
  LocaleKeys.trackNum,
  LocaleKeys.cabinet,
];

const pathToWelayats = 'assets/models/welayats.json';
const pathToCities = 'assets/models/cities.json';

abstract class DialogHandler {
  static void dialogMSG(
    enmDialogType type, {
    String? title,
    String? subtitle,
    Widget? body,
    Function()? onOkAction,
    String okText = "Ok",
    Function()? onCanselAction,
    String? canselText,
  }) {
    var titleIner = "";
    var subTitleIner = "";
    var imagePAth = "";
    var color = greenGlobal;
    if (type == enmDialogType.ok) {
      titleIner = LocaleKeys.success.tr;
      subTitleIner = LocaleKeys.paySuccess.tr;
      imagePAth = MyAssetsImages.svgSuccess;
    } else if (type == enmDialogType.error) {
      titleIner = LocaleKeys.somethingWrong.tr;
      subTitleIner = LocaleKeys.ckint.tr;
      imagePAth = MyAssetsImages.svgError;
      color = Theme.of(Get.context!).errorColor;
    } else if (type == enmDialogType.info) {
      titleIner = LocaleKeys.attention.tr;
      imagePAth = MyAssetsImages.svgInfo;
      color = Theme.of(Get.context!).primaryColor;
    }
    Get.defaultDialog(
        title: title ?? titleIner,
        content: body ??
            Column(
              children: [
                if (type == enmDialogType.none)
                  SizedBox()
                else
                  SvgPicture.asset(
                    imagePAth,
                    color: color,
                    fit: BoxFit.contain,
                    height: 75.h,
                  ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(subtitle ?? subTitleIner,
                      textAlign: TextAlign.center),
                )
              ],
            ),
        textCancel: canselText,
        onCancel: onCanselAction,
        textConfirm: okText,
        onConfirm: onOkAction);
  }
}

abstract class CardBinNums {
  static const turkmenbasyBank = [
    "9934322", //1304_CREDIT_cl
    "993430", //1304_ZARPLAT
    "993431", //1304_TELEKECHI_308
    "993432", //1304_CREDIT_CARD_309
    "993433", //1304_CORPORATIV_CARD_310
    "993436", //1304_SEMYA
    "993434", //1304_GOYUM_CARD
    "993435", //1304_PENSIYA
    "9934312", //1304_TELEKECHI_cl
    "9934032", //1304_ZARPLAT_cl
    "9934372", //1304_OWERDRAFT_cl
    "9934362", //1304_SEMYA_cl
    "9934352", //1304_PENSIYA_cl
    "993437", //1304_OWERDRAFT_CARD_314
    "9934342", //1304_GOYUM_cl
    "993403", //1304_ZARPLAT
  ];
  static const dayhanBank = [
    "993440", //1409_ZARPLAT
    "9934482", //1409_SEMYA_cl
    "993404", //1409_ZARPLAT_cl
    "993441", //1409_TELEKECHI_413
    "9934042", //1409_ZARPLAT_cl
    "9934442", //1409_GOYUM_cl
    "9934436", //1409_PAGTA_cl
    "993442", //1409_CREDIT_CARD_414_cl
    "993445", //1409_HEMAYAT_cl
    "993444", //1409_GOYUM_CARD_cl
    "993446", //1409_PENSIYA_cl
    "993449", //1409_GOYUM_CARD_0_cl
    "9934434", //1409_SHUGUNDUR
    "9934452", //1409_HEMAYAT_cl
    "9934412", //1409_TELEKECHI_cl
    "9934437", //1409_SHUGUNDUR_cl
    "9934492", //1409_GOYUM_0_cl
    "9934403", //1409_OWERDRAFT_cl
    "993448", //1409_SEMYA
    "993443", //1409_SHALY_cl
    "9934432", //1409_BUGDAY
    "9934462", //1409_PENSIYA_cl
    "9934472", //1409_KARENDECHI_cl
    "9934435", //1409_BUGDAY_cl
    "993447", //1409_KARENDECHI_cl
    "9934402", //1409_OWERDRAFT_CARD_423
    "9934422", //1409_CREDIT_cl
    "9934433", //1409_PAGTA
  ];
  static const turkmenistanBank = [
    "993450", //1506_ZARPLAT
    "9934552", //1506_GOYUM_cl
    "993405", //1506_ZARPLAT
    "993415", //1506_ESGER_TEST
    "993451", //1506_TELEKECHI_517
    "9934532", //1506_HEMAYAT_cl
    "993452", //1506_CREDIT_CARD_511
    "993456", //1506_ESGER
    "993457", //1506_TALYP
    "993454", //1506_PENSIYA_CARD
    "993453", //1506_HEMAYAT_CARD
    "993455", //1506_GOYUM_CARD
    "9934052", //1506_ZARPLAT_cl
    "9934542", //1506_PENSIYA_cl
    "9934512", //1506_TELEKECHI_cl
    "9934562", //1506_ESGER_cl
    "9934582", //1506_OWERDRAFT_cl
    "9934572", //1506_TALYP_cl
    "993458", //1506_OWERDRAFT_CARD_523
    "9934522", //1506_CREDIT_cl
  ];
  static const halkBank = [
    "993408", //1737_ZARPLAT
    "993406", //1601_ZARPLAT
    "993480", //1737_ZARPLAT
    "993460", //1601_ZARPLAT
    "993461", //1601_TELEKECHI_607
    "993481", //1737_TELEKECHI_746
    "993462", //1601_CREDIT_CARD_608
    "9934652", //1601_SEMYA_cl
    "993463", //1601_SHKOLNIK_CARD_609
    "993483", //1737_CORPORATIV_CARD_751
    "993467", //1601_BENZIN_LITR
    "993466", //1601_GOYUM_612
    "993468", //1601_PENSIYA
    "434403", //1601_VISA_CLASSIC_434403
    "993482", //1737_CREDIT_CARD_750
    "993464", //1601_CORPORATIV_CARD_610
    "993465", //1601_SEMYA_CARD_611
    "993485", //1601_OWERDRAFT_CARD_754
    "9934062", //1601_ZARPLAT_cl
    "9934682", //1601_PENSIYA_cl
    "9934612", //1601_TELEKECHI_cl
    "422488", //1601_VISA_GOLD_422488
    "993484", //1601_GOYUM_618_cl
    "9934662", //1601_GOYUM_cl
    "9934692", //1601_GOYUM_0_cl
    "9934622", //1601_CREDIT_cl
    "993469", //1601_GOYUM_603
  ];
  static const turkmenTurkBank = [
    "993409", //1731_ZARPLAT
    "993491", //1731_TELEKECHI_735
    "993490", //1731_ZARPLAT
    "993492", //1731_CREDIT_CARD_736
    "993493", //1731_CORPORATIV_CARD_747
    "993494", //1731_GOYUM_CARD
    "993495", //1731_SEMYA
    "993417", //1738_OWERDRAFT_CARD_755
    "993415", //1738_SEMYA
    "993414", //1738_CREDIT_CARD_748
    "993416", //1738_GOYUM_CARD_752
    "9934162", //1738_GOYUM_cl
    "9934132", //1738_TELEKECHI_cl
    "9934122", //1738_ZARPLAT_cl
    "9934142", //1738_CREDIT_cl
    "993412", //1738_ZARPLAT
    "993411", //1738_ZARPLAT
    "993413", //1738_TELEKECHI_745
  ];

  static const senagatBank = [
    "993407",
    "993470",
    "993471",
    "993473",
    "993474",
    "993475",
    "993472",
    "993402",
    "993421",
  ];
  static const rysgalBank = [
    "9934111",
  ];
  static const milli = [
    "601584", //Millikart
    "466565", //VISA Milli
    "400071", //VISA Gold
    "440252", //VISA Business
    "440251", //VISA Classic
    "478719", //VISA Electron
    "544242", //Mastercard Gold
    "547873", //MasterCard Business
    "511981", //MasterCard Standard
    "677695", //MasterCard Maestro
  ];
}

abstract class VersionDialogHAndler {
  static void dialogMSG(
    enmDialogType type, {
    String? title,
    String? subtitle,
    Widget? body,
  }) {
    var titleIner = "";
    var subTitleIner = "";
    var imagePAth = "";
    var color = greenGlobal;
    if (type == enmDialogType.ok) {
      titleIner = LocaleKeys.success.tr;
      subTitleIner = LocaleKeys.paySuccess.tr;
      imagePAth = MyAssetsImages.svgSuccess;
    } else if (type == enmDialogType.error) {
      titleIner = LocaleKeys.somethingWrong.tr;
      subTitleIner = LocaleKeys.ckint.tr;
      imagePAth = MyAssetsImages.svgError;
      color = Theme.of(Get.context!).errorColor;
    } else if (type == enmDialogType.info) {
      titleIner = LocaleKeys.attention.tr;
      imagePAth = MyAssetsImages.svgInfo;
      color = Theme.of(Get.context!).primaryColor;
    }
    Get.defaultDialog(
      title: title ?? titleIner,
      content: body ??
          Column(
            children: [
              if (type == enmDialogType.none)
                SizedBox()
              else
                SvgPicture.asset(
                  imagePAth,
                  color: color,
                  fit: BoxFit.contain,
                  height: 75.h,
                ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child:
                    Text(subtitle ?? subTitleIner, textAlign: TextAlign.center),
              )
            ],
          ),
    );
  }
}
