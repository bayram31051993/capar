import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../generated/locales.g.dart';
import '../utils/enums.dart';
import 'assets.dart';
import 'globals.dart';

abstract class Strings {
  static DateFormat saparFormat = DateFormat('dd.MM.yyyy HH:mm:ss');
  static DateFormat saparOnlyDateFormat = DateFormat('dd.MM.yyyy');

  static DateTime parserUniversal(String rawString) {
    DateTime radar = DateTime.now();
    if (rawString.isEmpty) return radar;
    try {
      radar = DateTime.parse(rawString);
    } catch (e) {
      if (rawString.split(" ").length == 1) {
        radar = saparOnlyDateFormat.parse(rawString);
      } else {
        radar = saparFormat.parse(rawString);
      }
    }
    return radar;
  }

  static String carNumberToRaw(String carNum) {
    return carNum.substring(0, 2) +
        " " +
        carNum.substring(2, 6) +
        " " +
        carNum.substring(6);
  }

  static String formatGTSPhoneFromeRaw(String raw) {
    if (raw == "-") return "-";
    if (raw.isEmpty || raw == "-") return "";
    return raw.substring(9).replaceAll(RegExp('-'), '');
  }

  static String formatHomePhoneFromeRaw(String raw) {
    if (raw == "-") return "-";
    if (raw.isEmpty || raw == "-") return "";
    return raw.substring(7).replaceAll(RegExp('-'), '');
  }

  static String formatPhoneToRaw(String origin, enmPaymentType type) {
    if (type.name.startsWith("agts") && origin.length < 8) {
      origin = "12$origin";
    }
    // if (type == enmPaymentType.tmCell && origin.length < 8) {
    //   origin = "65$origin";
    // }
    // if (type == enmPaymentType.cabelTV && origin.length < 8) {
    //   origin = "12$origin";
    // }

    if (origin.length == 8) {
      var raw = "+(993) ";
      raw += origin.substring(0, 2) + '-';
      raw += origin.substring(2, 4) + '-';
      raw += origin.substring(4, 6) + '-';
      raw += origin.substring(6);
      print("Numbers " + raw);
      return raw;
    } else if (origin.length == 12) {
      var raw = "";
      raw += origin.substring(0, 1) + '(';
      raw += origin.substring(1, 4) + ') ';
      raw += origin.substring(4, 6) + '-';
      raw += origin.substring(6, 8) + '-';
      raw += origin.substring(8, 10) + '-';
      raw += origin.substring(10);
      return raw;
    } else if (origin.length == 11) {
      var raw = "+(";
      raw += origin.substring(0, 3) + ') ';
      raw += origin.substring(3, 5) + '-';
      raw += origin.substring(5, 7) + '-';
      raw += origin.substring(7, 9) + '-';
      raw += origin.substring(9);
      return raw;
    } else if (origin.length == 14) {
      var raw = "";
      origin.removeAllWhitespace;
      raw += origin.substring(0, 1) + '(';
      raw += origin.substring(1, 4) + ')';
      raw += origin.substring(4, 7) + '-';
      raw += origin.substring(8, 10) + '-';
      raw += origin.substring(10, 12) + '-';
      raw += origin.substring(12);
      return raw;
    } else if (origin.length == 9) {
      var raw = "+(993) ";
      origin.replaceAll('8', '');
      raw += origin.substring(1, 3) + '-';
      raw += origin.substring(3, 5) + '-';
      raw += origin.substring(5, 7) + '-';
      raw += origin.substring(7);
      return raw;
    } else {
      return origin;
    }
  }

  static Map<String, dynamic> getParams(
      enmPaymentType type, String amount, String phone) {
    Map<String, dynamic> param = {};
    var phoneNum = "";
    if (type.name.startsWith("agts")) {
      phoneNum = Strings.formatGTSPhoneFromeRaw(phone);
    } else {
      phoneNum = Strings.formatHomePhoneFromeRaw(phone);
    }
    //phoneNum = Strings.formatGTSPhoneFromeRaw(phone);
    switch (type) {
      // case enmPaymentType.agtsInternet:
      //   param = {
      //     "phone": phoneNum,
      //     "amount": amount,
      //     "service": "internet",
      //   };
      // break;
      // case enmPaymentType.agtsIpTv:
      //   param = {
      //     "phone": phoneNum,
      //     "amount": amount,
      //     "service": "iptv",
      //   };
      //   break;
      // case enmPaymentType.cabelTV: // new addd
      //   param = {
      //     "phone": phoneNum,
      //     "amount": amount,
      //     "service": "cv",
      //   };
      //   break;
      // case enmPaymentType.agtsTelefon:
      //   param = {
      //     "phone": phoneNum,
      //     "amount": amount,
      //     "service": "phone",
      //   };
      //   break;
      // case enmPaymentType.tmCell:
      //   param = {
      //     "phone": phoneNum,
      //     "amount": amount,
      //   };
      //   break;
      // case enmPaymentType.tmTelekom:
      //   param = {
      //     "phone": phoneNum,
      //     "amount": amount,
      //   };
      //   break;
      default:
    }
    return param;
  }

  static String getPaymentMethodDescription(enmPaymentMethod method) {
    var rezult = '';
    if (method == enmPaymentMethod.halkBank) {
      rezult = LocaleKeys.payTypeHB.tr;
    } else if (method == enmPaymentMethod.millicart) {
      rezult = LocaleKeys.payTypeMilli.tr;
    } else if (method == enmPaymentMethod.mobile) {
      rezult = LocaleKeys.payTypeMobile.tr;
    } else {
      rezult = LocaleKeys.payTypeCash.tr;
    }
    return rezult;
  }

  static String getPaymentMethodIconPath(enmPaymentMethod method) {
    var rezult = '';
    if (method == enmPaymentMethod.halkBank) {
      rezult = MyAssetsImages.payWithHalkbank;
    } else if (method == enmPaymentMethod.millicart) {
      rezult = MyAssetsImages.payWithMilli;
    } else if (method == enmPaymentMethod.mobile) {
      rezult = MyAssetsImages.payWithMobile;
    } else {
      rezult = MyAssetsImages.payWithCash;
    }
    return rezult;
  }

  static String getPaymentMethodString(enmPaymentMethod method) {
    var rezult = '';
    if (method == enmPaymentMethod.halkBank) {
      rezult = paymentTypeBankHalkbank;
    } else if (method == enmPaymentMethod.millicart) {
      rezult = paymentTypeBankMillicart;
    } else if (method == enmPaymentMethod.senagat) {
      rezult = paymentTypeBankSenagat;
    } else if (method == enmPaymentMethod.rysgal) {
      rezult = paymentTypeBankRysgal;
    } else if (method == enmPaymentMethod.mobile) {
      rezult = paymentTypeMobile;
    } else {
      rezult = paymentTypeCash;
    }
    return rezult;
  }

  static Map<String, dynamic> pathToBankCard(String bind) {
    var typeOfBank = wichType(bind);
    return {
      'name': pathToBankName(typeOfBank),
      'path': pathToBankImage(typeOfBank),
      'type': typeOfBank,
      'method': pathToBankMethod(typeOfBank),
    };
  }

  static Map<String, dynamic> pathPassenger(
      String fName, lName, gender, bDay, dNumber) {
    return {
      'fName': fName,
      'lName': lName,
      'gender': gender,
      'bDay': bDay,
      'dNumber': dNumber
    };
  }

  static enmBankKartlar wichType(String bind9digets) {
    enmBankKartlar foundType = enmBankKartlar.unknown;
    for (var type in enmBankKartlar.values) {
      var list = _belongBinds(type);
      if (foundType != enmBankKartlar.unknown) break;
      for (var bin in list) {
        if (bind9digets.replaceAll(" ", "").startsWith(bin)) {
          foundType = type;
          break;
        }
      }
    }
    return foundType;
  }

  static String pathToBankImage(enmBankKartlar type) {
    switch (type) {
      case enmBankKartlar.turkmenbasyBank:
        return MyAssetsImages.creditTurkmBashyB;
      case enmBankKartlar.dayhanBank:
        return MyAssetsImages.creditDayhanB;
      case enmBankKartlar.turkmenistanBank:
        return MyAssetsImages.creditTurkmstanB;
      case enmBankKartlar.halkBank:
        return MyAssetsImages.creditHB;
      case enmBankKartlar.senagatBank:
        return MyAssetsImages.creditSenagatB;
      case enmBankKartlar.turkmenTurkBank:
        return MyAssetsImages.creditTTB;
      case enmBankKartlar.rysgalBank:
        return MyAssetsImages.creditRysgalB;
      case enmBankKartlar.milli:
        return MyAssetsImages.creditMilli;
      case enmBankKartlar.unknown:
        return MyAssetsImages.creditMock;
    }
  }

  static String pathToBankName(enmBankKartlar type) {
    switch (type) {
      case enmBankKartlar.turkmenbasyBank:
        return 'Türkmenbaşybank';
      case enmBankKartlar.dayhanBank:
        return 'Daýhanbank';
      case enmBankKartlar.turkmenistanBank:
        return 'Türkmenistanbank';
      case enmBankKartlar.halkBank:
        return 'Halkbank';
      case enmBankKartlar.senagatBank:
        return 'Senagatbank';
      case enmBankKartlar.turkmenTurkBank:
        return 'TürkmenTürk';
      case enmBankKartlar.rysgalBank:
        return 'Rysgalbank';
      case enmBankKartlar.milli:
        return 'Milli Vnesh';
      case enmBankKartlar.unknown:
        return 'Halkbank';
    }
  }

  static enmPaymentMethod pathToBankMethod(enmBankKartlar type) {
    switch (type) {
      case enmBankKartlar.turkmenbasyBank:
        return enmPaymentMethod.halkBank;
      case enmBankKartlar.dayhanBank:
        return enmPaymentMethod.halkBank;
      case enmBankKartlar.turkmenistanBank:
        return enmPaymentMethod.halkBank;
      case enmBankKartlar.halkBank:
        return enmPaymentMethod.halkBank;
      case enmBankKartlar.senagatBank:
        return enmPaymentMethod.senagat;
      case enmBankKartlar.turkmenTurkBank:
        return enmPaymentMethod.halkBank;
      case enmBankKartlar.rysgalBank:
        return enmPaymentMethod.rysgal;
      case enmBankKartlar.milli:
        return enmPaymentMethod.millicart;
      case enmBankKartlar.unknown:
        return enmPaymentMethod.halkBank;
    }
  }

  static List<String> _belongBinds(enmBankKartlar type) {
    switch (type) {
      case enmBankKartlar.turkmenbasyBank:
        return CardBinNums.turkmenbasyBank;
      case enmBankKartlar.dayhanBank:
        return CardBinNums.dayhanBank;
      case enmBankKartlar.turkmenistanBank:
        return CardBinNums.turkmenistanBank;
      case enmBankKartlar.halkBank:
        return CardBinNums.halkBank;
      case enmBankKartlar.senagatBank:
        return CardBinNums.senagatBank;
      case enmBankKartlar.turkmenTurkBank:
        return CardBinNums.turkmenTurkBank;
      case enmBankKartlar.rysgalBank:
        return CardBinNums.rysgalBank;
      case enmBankKartlar.milli:
        return CardBinNums.milli;
      case enmBankKartlar.unknown:
        return CardBinNums.halkBank;
    }
  }

  static String backTicket(enmticketBack type) {
    var rezult = '';
    switch (type) {
      case enmticketBack.airplane_back:
        rezult = MyAssetsImages.airport_back;
        break;
      case enmticketBack.train_back:
        rezult = MyAssetsImages.airport_back;
        break;
      default:
    }
    return rezult;
  }

  static String communicationToPayMethod(enmPaymetnComunication type) {
    var rezult = '';
    switch (type) {
      case enmPaymetnComunication.tmTelekom:
        rezult = MyAssetsImages.pngWiFitelekom;
        break;
      case enmPaymetnComunication.tmCell:
        rezult = MyAssetsImages.pngTmCell;
        break;
      case enmPaymetnComunication.agtsInternet:
        rezult = MyAssetsImages.pngWiFiAgts;
        break;
      case enmPaymetnComunication.agtsTelefon:
        rezult = MyAssetsImages.pngAgtsHome;
        break;
      default:
    }
    return rezult;
  }

  static String communicationTittletoPayment(enmPaymetnComunication type) {
    var result = '';
    switch (type) {
      case enmPaymetnComunication.tmTelekom:
        return LocaleKeys.telecIinet;
      case enmPaymetnComunication.tmCell:
        return LocaleKeys.altAsyr;
      case enmPaymetnComunication.agtsInternet:
        return LocaleKeys.astuInet;
      case enmPaymetnComunication.agtsTelefon:
        return LocaleKeys.astuTel;
      default:
    }
    return LocaleKeys.all.tr;
  }

  static String pathToCommunication(enmPaymetnComunication type) {
    var rezult = '';
    switch (type) {
      case enmPaymetnComunication.tmTelekom:
        rezult = MyAssetsImages.pngWiFitelekom;
        break;
      case enmPaymetnComunication.tmCell:
        rezult = MyAssetsImages.pngTmCell;
        break;
      case enmPaymetnComunication.agtsInternet:
        rezult = MyAssetsImages.pngWiFiAgts;
        break;
      case enmPaymetnComunication.agtsTelefon:
        rezult = MyAssetsImages.pngAgtsHome;
        break;
    }
    return rezult;
  }

  static String pathToPayMethod(enmPaymentType type) {
    var rezult = '';
    switch (type) {
      case enmPaymentType.pygg:
        rezult = MyAssetsImages.pngPygg;
        break;
      case enmPaymentType.communcation:
        rezult = MyAssetsImages.communication;
        break;
      case enmPaymentType.media:
        rezult = MyAssetsImages.media;
        break;
      case enmPaymentType.conmmunal:
        rezult = MyAssetsImages.communal;
        break;
      // case enmPaymentType.tmTelekom:
      //   rezult = MyAssetsImages.pngWiFitelekom;
      //   break;
      // case enmPaymentType.tmCell:
      //   rezult = MyAssetsImages.pngTmCell;
      //   break;
      // case enmPaymentType.agtsInternet:
      //   rezult = MyAssetsImages.pngWiFiAgts;
      //   break;
      // case enmPaymentType.agtsTelefon:
      //   rezult = MyAssetsImages.pngAgtsHome;
      //   break;
      // case enmPaymentType.agtsIpTv:
      //   rezult = MyAssetsImages.pngTv;
      //   break;
      // case enmPaymentType.cabelTV:
      //   rezult = MyAssetsImages.pngIpTv;
      //   break;
      // case enmPaymentType.water:
      //   rezult = MyAssetsImages.pngWater;
      //   break;
      // case enmPaymentType.electro:
      //   rezult = MyAssetsImages.pngElectro;
      //   break;
      // case enmPaymentType.utils:
      //   rezult = MyAssetsImages.pngUtils;
      //   break;
      case enmPaymentType.ticket:
        rezult = MyAssetsImages.pngTicket;
        break;
      case enmPaymentType.suw_tut:
        rezult = MyAssetsImages.pngTutLogo;
        break;
      // case enmPaymentType.student:
      //   rezult = MyAssetsImages.pngStudent;
      //   break;
      // case enmPaymentType.migration:
      //   rezult = MyAssetsImages.pngMigration;
      //   break;
      // case enmPaymentType.licese:
      //   rezult = MyAssetsImages.pngCertificate;
      //   break;
      default:
    }
    return rezult;
  }

  static String phoneNumberFormat(String rawPhone) {
    if (rawPhone.isEmpty || rawPhone.length < 7) return "";
    return rawPhone.substring(7).replaceAll(RegExp('-'), '');
  }

  static String titleOfPaySort(enmPaymentSort type) {
    switch (type) {
      case enmPaymentSort.all:
        return LocaleKeys.all.tr;

      case enmPaymentSort.capar:
        return LocaleKeys.courier.tr;

      case enmPaymentSort.pygg:
        return LocaleKeys.fraffFines.tr;

      case enmPaymentSort.tmCell:
        return LocaleKeys.altAsyr.tr;

      case enmPaymentSort.tmTelekom:
        return LocaleKeys.telecIinet.tr;

      case enmPaymentSort.agtsInternet:
        return LocaleKeys.astuInet.tr;

      case enmPaymentSort.agtsTelefon:
        return LocaleKeys.astuTel.tr;

      case enmPaymentSort.agtsIpTv:
        return LocaleKeys.astuIptv.tr;
      case enmPaymentSort.telecomTV:
        return LocaleKeys.telTV.tr;

      case enmPaymentSort.utils:
        return LocaleKeys.utils.tr;

      case enmPaymentSort.water:
        return LocaleKeys.uwater.tr;

      case enmPaymentSort.electro:
        return LocaleKeys.uelectro.tr;

      case enmPaymentSort.cabelTV:
        return LocaleKeys.cableTv.tr;

      case enmPaymentSort.student:
        return LocaleKeys.studentPay.tr;

      case enmPaymentSort.licese:
        return LocaleKeys.licensePAy.tr;

      case enmPaymentSort.migration:
        return LocaleKeys.migrationPay.tr;
    }
  }

  static String titleJemagat(enmJemagatToleg type) {
    switch (type) {
      case enmJemagatToleg.jemagat:
        return LocaleKeys.utils.tr;
      case enmJemagatToleg.electro:
        return LocaleKeys.uelectro.tr;
      case enmJemagatToleg.water:
        return LocaleKeys.uwater.tr;
      case enmJemagatToleg.gaz:
        return LocaleKeys.ugaz.tr;
    }
  }

  static String titleOfCommunication(enmPaymetnComunication type) {
    switch (type) {
      case enmPaymetnComunication.tmTelekom:
        return LocaleKeys.telecIinet;
      case enmPaymetnComunication.tmCell:
        return LocaleKeys.altAsyr;
      case enmPaymetnComunication.agtsInternet:
        return LocaleKeys.astuInet;
      case enmPaymetnComunication.agtsTelefon:
        return LocaleKeys.astuTel;
      default:
    }
    return LocaleKeys.all.tr;
  }

  static String titleOfPayMethod(enmPaymentType type) {
    switch (type) {
      // case enmPaymentType.capar:
      //   return LocaleKeys.courier;
      case enmPaymentType.pygg:
        return LocaleKeys.fraffFines;
      case enmPaymentType.communcation:
        return LocaleKeys.communication;
      case enmPaymentType.media:
        return LocaleKeys.media;
      case enmPaymentType.conmmunal:
        return LocaleKeys.communal;
      // case enmPaymentType.tmTelekom:
      //   return LocaleKeys.telecIinet;
      // case enmPaymentType.tmCell:
      //   return LocaleKeys.altAsyr;
      // case enmPaymentType.agtsInternet:
      //   return LocaleKeys.astuInet;
      // case enmPaymentType.agtsTelefon:
      //   return LocaleKeys.astuTel;
      // case enmPaymentType.agtsIpTv:
      //   return LocaleKeys.astuIptv;
      // case enmPaymentType.telecomTV:
      //   return LocaleKeys.telTV;
      // case enmPaymentType.cabelTV:
      // return LocaleKeys.cableTv;
      // case enmPaymentType.water:
      //   return LocaleKeys.uwater;
      // case enmPaymentType.electro:
      //   return LocaleKeys.uelectro;
      // case enmPaymentType.utils:
      // return LocaleKeys.utils;
      case enmPaymentType.ticket:
        return LocaleKeys.ticket;
      case enmPaymentType.suw_tut:
        return LocaleKeys.suw_tut;
      // case enmPaymentType.student:
      //   return LocaleKeys.studentPay;
      // case enmPaymentType.licese:
      //   return LocaleKeys.licensePAy;
      // case enmPaymentType.migration:
      //   return LocaleKeys.migrationPay;
      default:
        return LocaleKeys.all.tr;
    }
  }

  static uriOfPayMethod(enmPaymentMethod type) {
    if (type == enmPaymentMethod.halkBank) {
      return paymentTypeBankHalkbank;
    } else if (type == enmPaymentMethod.millicart) {
      return paymentTypeBankMillicart;
    } else if (type == enmPaymentMethod.mobile) {
      return paymentTypeMobile;
    } else {
      return paymentTypeMobile;
    }
  }

  static String title(enmTextFielType type) {
    var rez = '';
    switch (type) {
      case enmTextFielType.none:
        break;
      case enmTextFielType.adressFiel:
        rez = LocaleKeys.address.tr;
        break;
      case enmTextFielType.amonutField:
        rez = LocaleKeys.amount.tr;
        break;
      case enmTextFielType.carNumField:
        rez = LocaleKeys.carNum.tr;
        break;
      case enmTextFielType.cellPhoneField:
        rez = LocaleKeys.phoneNum.tr;
        break;
      case enmTextFielType.user_register:
        rez = LocaleKeys.phoneNum.tr;
        break;
      case enmTextFielType.agtsPhoneField:
        rez = LocaleKeys.gtsPhoneNum.tr;
        break;
      case enmTextFielType.homePhoneField:
        rez = LocaleKeys.cityPhoneNum.tr;
        break;
      case enmTextFielType.nameField:
        rez = LocaleKeys.name.tr;
        break;
      case enmTextFielType.surnameField:
        rez = LocaleKeys.surname.tr;
        break;
      case enmTextFielType.trafficFineField:
        rez = LocaleKeys.fineNum.tr;
        break;
      case enmTextFielType.vidoePhotopay:
        rez = LocaleKeys.fineNum.tr;
        break;
      case enmTextFielType.weightField:
        rez = LocaleKeys.weight.tr;
        break;
      case enmTextFielType.kod:
        rez = LocaleKeys.confrCode.tr;
        break;
      case enmTextFielType.utils:
        rez = LocaleKeys.utils.tr;
        break;
      case enmTextFielType.energykWt:
        rez = LocaleKeys.uelectro.tr;
        break;
      case enmTextFielType.waterM3:
        rez = LocaleKeys.uwater.tr;
        break;
      case enmTextFielType.gazM3:
        rez = LocaleKeys.ugaz.tr;
        break;
      case enmTextFielType.trek:
        rez = "${LocaleKeys.add.tr} ${LocaleKeys.trac.tr}";
        break;
      case enmTextFielType.description:
        rez = LocaleKeys.description.tr;
        break;
      case enmTextFielType.abonetTelefon:
        rez = LocaleKeys.abonetMeeting.tr;
        break;
      case enmTextFielType.search:
        rez = LocaleKeys.search.tr;
        break;
      case enmTextFielType.password:
        rez = LocaleKeys.pass.tr;
        break;
      case enmTextFielType.confPassword:
        rez = LocaleKeys.confPass.tr;
        break;
      case enmTextFielType.ticket_from:
        rez = LocaleKeys.from.tr;
        break;
      case enmTextFielType.ticket_to:
        rez = LocaleKeys.to.tr;
        break;
      case enmTextFielType.ticket_depature:
        rez = LocaleKeys.departure.tr;
        break;
      case enmTextFielType.ticket_arrival:
        rez = LocaleKeys.arrival.tr;
        break;
      case enmTextFielType.ticket_passengers:
        rez = LocaleKeys.passengers.tr;
        break;
      case enmTextFielType.waterId:
        rez = LocaleKeys.waterId.tr;
        break;
      case enmTextFielType.gazId:
        rez = LocaleKeys.gazId.tr;
        break;
      case enmTextFielType.electroId:
        rez = LocaleKeys.electroId.tr;
        break;
      case enmTextFielType.communalId:
        rez = LocaleKeys.communalId.tr;
        break;
      case enmTextFielType.homeAddress:
        rez = LocaleKeys.address.tr;
        break;
      default:
    }
    return rez;
  }

  static String description(enmTextFielType type) {
    var rez = '';
    switch (type) {
      case enmTextFielType.none:
        break;
      case enmTextFielType.adressFiel:
        rez = LocaleKeys.address.tr;
        break;
      case enmTextFielType.amonutField:
        rez = LocaleKeys.amount.tr;
        break;
      case enmTextFielType.carNumField:
        rez = LocaleKeys.descrCarNum.tr;
        break;
      case enmTextFielType.homeAddress:
        rez = LocaleKeys.address.tr;
        break;
      case enmTextFielType.cellPhoneField:
        rez = LocaleKeys.phoneNum.tr;
        break;
      case enmTextFielType.user_register:
        rez = LocaleKeys.phoneNum.tr;
        break;
      case enmTextFielType.agtsPhoneField:
        rez = LocaleKeys.phoneNum.tr;
        break;
      case enmTextFielType.homePhoneField:
        rez = LocaleKeys.descrHomePhone.tr;
        break;
      case enmTextFielType.nameField:
        rez = LocaleKeys.descrName.tr;
        break;
      case enmTextFielType.surnameField:
        rez = LocaleKeys.descrSurname.tr;
        break;
      case enmTextFielType.trafficFineField:
        rez = LocaleKeys.fineNum.tr;
        break;
      case enmTextFielType.vidoePhotopay:
        rez = LocaleKeys.fineNum.tr;
        break;
      case enmTextFielType.weightField:
        rez = LocaleKeys.weight.tr;
        break;
      case enmTextFielType.kod:
        rez = LocaleKeys.confrCode.tr;
        break;
      case enmTextFielType.trek:
        rez = "${LocaleKeys.add.tr} ${LocaleKeys.trac.tr}";
        break;
      case enmTextFielType.description:
        rez = LocaleKeys.description.tr;
        break;
      case enmTextFielType.utils:
        rez = LocaleKeys.utils.tr;
        break;
      case enmTextFielType.gazM3:
        rez = LocaleKeys.ugaz.tr;
        break;
      case enmTextFielType.energykWt:
        rez = LocaleKeys.uelectro.tr;
        break;
      case enmTextFielType.waterM3:
        rez = LocaleKeys.uwater.tr;
        break;
      case enmTextFielType.password:
        rez = LocaleKeys.pass.tr;
        break;
      case enmTextFielType.confPassword:
        rez = LocaleKeys.confPass.tr;
        break;
      case enmTextFielType.ticket_from:
        rez = LocaleKeys.from.tr;
        break;
      case enmTextFielType.ticket_to:
        rez = LocaleKeys.to.tr;
        break;
      case enmTextFielType.ticket_depature:
        rez = LocaleKeys.departure.tr;
        break;
      case enmTextFielType.ticket_arrival:
        rez = LocaleKeys.arrival.tr;
        break;
      case enmTextFielType.ticket_passengers:
        rez = LocaleKeys.passengers.tr;
        break;
      case enmTextFielType.waterId:
        rez = LocaleKeys.waterId.tr;
        break;
      case enmTextFielType.gazId:
        rez = LocaleKeys.gazId.tr;
        break;
      case enmTextFielType.electroId:
        rez = LocaleKeys.electroId.tr;
        break;
      case enmTextFielType.communalId:
        rez = LocaleKeys.communalId.tr;
        break;
      default:
    }
    return rez;
  }

  static Icon? iconData(enmTextFielType type) {
    Icon? rez;
    switch (type) {
      case enmTextFielType.none:
        break;
      case enmTextFielType.adressFiel:
        rez =
            Icon(Icons.location_on, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.amonutField:
        rez = Icon(Icons.money, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.carNumField:
        rez =
            Icon(Icons.car_rental, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.homeAddress:
        rez = Icon(Icons.apartment, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.cellPhoneField:
        rez = Icon(Icons.phone_android,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.user_register:
        rez = Icon(Icons.phone_android,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.agtsPhoneField:
        rez = Icon(Icons.phone, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.homePhoneField:
        rez = Icon(Icons.phone, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.nameField:
        rez = Icon(Icons.person, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.surnameField:
        rez = Icon(Icons.person, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.trafficFineField:
        rez = Icon(Icons.receipt_long,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.vidoePhotopay:
        rez = Icon(Icons.receipt_long,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.weightField:
        rez =
            Icon(Icons.line_weight, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.kod:
        rez = Icon(Icons.lock, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.trek:
        rez = Icon(Icons.qr_code_2, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.description:
        rez =
            Icon(Icons.description, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.waterM3:
        rez = Icon(Icons.water_damage_rounded,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.energykWt:
        rez = Icon(Icons.electrical_services,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.utils:
        rez = Icon(Icons.home_work_rounded,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.gazM3:
        rez = Icon(Icons.local_fire_department,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.abonetTelefon:
        rez = Icon(Icons.receipt, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.search:
        rez = Icon(Icons.search, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.password:
        rez = Icon(Icons.key, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.confPassword:
        rez = Icon(Icons.key, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.ticket_from:
        rez = Icon(Icons.flight_takeoff,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.ticket_to:
        rez =
            Icon(Icons.flight_land, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.ticket_arrival:
        rez =
            Icon(Icons.date_range, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.ticket_depature:
        rez =
            Icon(Icons.date_range, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.ticket_passengers:
        rez = Icon(Icons.person, color: Theme.of(Get.context!).primaryColor);
        break;

      case enmTextFielType.waterId:
        rez =
            Icon(Icons.water_drop, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.electroId:
        rez = Icon(Icons.electric_bolt,
            color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.communalId:
        rez = Icon(Icons.house, color: Theme.of(Get.context!).primaryColor);
        break;
      case enmTextFielType.gazId:
        rez = Icon(Icons.gas_meter, color: Theme.of(Get.context!).primaryColor);
        break;
      default:
    }
    return rez;
  }

// Зарос Интернет
  static String uriStep1Prex(enmPaymentType type, enmPaymentMethod method) {
    var payType = '';
    switch (type) {
      case enmPaymentType.pygg:
        payType = paymentMethodPYGG;
        break;
      // case enmPaymentType.tmTelekom:
      //   payType = paymentMethodTelecom;
      //   break;
      // case enmPaymentType.tmCell:
      //   payType = paymentMethodTmCell;
      //   break;
      // case enmPaymentType.agtsInternet:
      //   payType = paymentMethodGTS;
      //   break;
      // case enmPaymentType.agtsTelefon:
      //   payType = paymentMethodGTS;
      //   break;
      // case enmPaymentType.agtsIpTv:
      //   payType = paymentMethodGTS;
      //   break;
      // case enmPaymentType.telecomTV:
      //   payType = paymentMethodTelecom;
      //   break;
      // case enmPaymentType.cabelTV:
      //   payType = payCableTV; //?
      //   break;
      // case enmPaymentType.water:
      //   payType = paymentMethodPublicUtilsManual;
      //   break;
      // case enmPaymentType.electro:
      //   payType = paymentMethodPublicUtilsManual;
      //   break;
      // case enmPaymentType.utils:
      //   payType = paymentMethodPublicUtils;
      //   break;
      // case enmPaymentType.capar:
      //   payType = uRLCallCreate;
      //   break;
      default:
    }
    String payMethod = getPaymentMethodString(method);

    return '/api/$payType/?payment-type=$payMethod';
  }

  static double checkDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static double? checkDoubleNUllable(dynamic value) {
    if (value == "-") return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return null;
  }

  static String uriStep1PrexStr(enmPaymentType type, String method) {
    var payType = '';
    switch (type) {
      case enmPaymentType.pygg:
        payType = paymentMethodPYGG;
        break;
      // case enmPaymentType.tmTelekom:
      //   payType = paymentMethodTelecom;
      //   break;
      // case enmPaymentType.tmCell:
      //   payType = paymentMethodTmCell;
      //   break;
      // case enmPaymentType.agtsInternet:
      //   payType = paymentMethodGTS;
      //   break;
      // case enmPaymentType.agtsTelefon:
      //   payType = paymentMethodGTS;
      //   break;
      // case enmPaymentType.agtsIpTv:
      //   payType = paymentMethodGTS;
      //   break;
      // case enmPaymentType.telecomTV:
      //   payType = paymentMethodTelecom;
      //   break;
      // case enmPaymentType.cabelTV:
      //   payType = payCableTV; //?
      //   break;
      // case enmPaymentType.water:
      //   payType = paymentMethodPublicUtils;
      //   break;
      // case enmPaymentType.electro:
      //   payType = paymentMethodPublicUtils;
      //   break;
      // case enmPaymentType.utils:
      //   payType = paymentMethodPublicUtils;
      //   break;
      // case enmPaymentType.capar:
      //   payType = uRLCallCreate;
      //   break;
      default:
    }
    return '/api/$payType/?payment-type=$method';
  }

  static String? validator(enmTextFielType type, String? value) {
    InitializerController controller = Get.put(InitializerController());
    if (type == enmTextFielType.description) {
      return null;
    }
    if (value != null && value.isEmpty) {
      return LocaleKeys.mustntEmpty.tr;
    } else if (type == enmTextFielType.waterM3 ||
        type == enmTextFielType.energykWt) {
      var d = double.tryParse(value!);
      return d == null ? LocaleKeys.notValid.tr : null;
    } else if (type == enmTextFielType.kod) {
      if (value!.length != 5) return LocaleKeys.fiveDigits.tr;
    } else if (type == enmTextFielType.carNumField) {
      if (value == null) return null;
      if (value.startsWith("00") ||
          value.startsWith("01") ||
          value.startsWith("02") ||
          value.startsWith("03") ||
          value.startsWith("04") ||
          value.startsWith("05")) {
        return LocaleKeys.notValid.tr;
      }
      return null;
    } else if (type == enmTextFielType.cellPhoneField) {
      if (value!.length != 18) {
        return LocaleKeys.notValid.tr;
      }
    } else if (type == enmTextFielType.user_register) {
      if (value!.length != 8) {
        return LocaleKeys.notValid.tr;
      }
      // var str = value.substring(6, 9);
      // var codeNum = int.tryParse(str);
      // if (codeNum! < 61 || codeNum > 65) {
      //   return LocaleKeys.phoneStartErr.tr;
      // }
    } else if (type == enmTextFielType.homePhoneField) {
      if (value!.length != 18) {
        return LocaleKeys.notValid.tr;
      }
      var str = value.substring(7, 9);
      var codeCountry = int.tryParse(str);
      if (codeCountry! < 12 || codeCountry > 59) {
        return LocaleKeys.phoneStartErr.tr;
      }
    } else if (type == enmTextFielType.agtsPhoneField) {
      if (value!.length != 18) {
        return LocaleKeys.notValid.tr;
      }
      // } else if (type == enmTextFielType.abonetTelefon) {
      //   var str = value!.substring(6, 9);
      //   var codeNum = int.tryParse(str);
      //   if (codeNum! < 12 || codeNum > 65) {
      //     return LocaleKeys.phoneStartErr.tr;
      //   }
    } else if (type == enmTextFielType.amonutField) {
      if (double.tryParse(value!) == null) return LocaleKeys.notValid.tr;
    } else if (type == enmTextFielType.password) {
      RegExp regex = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      var passNonNullValue = value ?? "";
      if (passNonNullValue.isEmpty) {
        return LocaleKeys.enter_pass.tr;
      } else if (!regex.hasMatch(passNonNullValue)) {
        return LocaleKeys.chk_pass.tr;
      }
    } else if (type == enmTextFielType.confPassword) {
      if (value!.isEmpty && controller.confPass != controller.pass) {
        return LocaleKeys.notMatchPass.tr;
      }
    }
    return null;
  }

  static enmStorageKeys enmConvertor(enmTextFielType type) {
    switch (type) {
      case enmTextFielType.none:
        return enmStorageKeys.none;
      case enmTextFielType.nameField:
        return enmStorageKeys.names;
      case enmTextFielType.surnameField:
        return enmStorageKeys.surnames;
      case enmTextFielType.adressFiel:
        return enmStorageKeys.addreses;
      case enmTextFielType.cellPhoneField:
        return enmStorageKeys.phonesCell;
      case enmTextFielType.user_register:
        return enmStorageKeys.user_register;
      case enmTextFielType.homePhoneField:
        return enmStorageKeys.homePhonesOther;
      case enmTextFielType.agtsPhoneField:
        return enmStorageKeys.agtshomePhones;
      case enmTextFielType.weightField:
        return enmStorageKeys.none;
      case enmTextFielType.trafficFineField:
        return enmStorageKeys.none;
      case enmTextFielType.vidoePhotopay:
        return enmStorageKeys.none;
      case enmTextFielType.carNumField:
        return enmStorageKeys.carsNums;
      case enmTextFielType.amonutField:
        return enmStorageKeys.none;
      case enmTextFielType.kod:
        return enmStorageKeys.none;
      case enmTextFielType.trek:
        return enmStorageKeys.none;
      case enmTextFielType.description:
        return enmStorageKeys.none;
      case enmTextFielType.abonetTelefon:
        return enmStorageKeys.abonentNum;
      case enmTextFielType.utils:
        return enmStorageKeys.none;
      case enmTextFielType.energykWt:
        return enmStorageKeys.none;
      case enmTextFielType.waterM3:
        return enmStorageKeys.none;
      case enmTextFielType.gazM3:
        return enmStorageKeys.none;
      case enmTextFielType.waterId:
        return enmStorageKeys.waterId;
      case enmTextFielType.gazId:
        return enmStorageKeys.gazId;
      case enmTextFielType.electroId:
        return enmStorageKeys.electroId;
      case enmTextFielType.communalId:
        return enmStorageKeys.communalId;
      default:
        return enmStorageKeys.none;
    }
  }
}
