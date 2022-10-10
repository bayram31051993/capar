import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/InitializerView/initializer_view.dart';
import 'package:permission_handler/permission_handler.dart';

import 'strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../generated/locales.g.dart';
import '../utils/enums.dart';

abstract class MyButtons {
  static ButtonStyle rounded({bool primery = false}) => ButtonStyle(
        alignment: Alignment.center,
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 14.w)),
        backgroundColor: MaterialStateProperty.all(primery
            ? Theme.of(Get.context!).primaryColor
            : Theme.of(Get.context!).colorScheme.secondary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      );
  static ButtonStyle square = ButtonStyle(
    alignment: Alignment.center,
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 14.w)),
    backgroundColor:
        MaterialStateProperty.all(Theme.of(Get.context!).colorScheme.secondary),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.r),
      ),
    ),
  );
}

abstract class TextInputStyles {
  static TextInputFormatter maskFilter(enmTextFielType type) {
    if (type == enmTextFielType.cellPhoneField) {
      return maskCellPhone;
    } else if (type == enmTextFielType.homePhoneField) {
      return maskHomePhone;
    } else if (type == enmTextFielType.agtsPhoneField) {
      return maskAGTSPhone;
      // } else if (type == enmTextFielType.carNumField) {
      //   return maskCarNumber;
    } else if (type == enmTextFielType.kod) {
      return maskCode;
    } else if (type == enmTextFielType.abonetTelefon) {
      return maskAbonentPhone;
    } else if (type == enmTextFielType.trafficFineField) {
      return maskCarTicket;
    } else if (type == enmTextFielType.vidoePhotopay) {
      return maskCarVideoPhotoPay;
    } else if (type == enmTextFielType.amonutField) {
      return maskPayAmount;
    } else if (type == enmTextFielType.user_register) {
      return maskRegister;
    } else {
      return MaskTextInputFormatter();
    }
  }

  static final formatCurrency =
      NumberFormat.simpleCurrency(locale: "en_US", name: "");

  static TextInputType keyboardType(enmTextFielType type) {
    if (type == enmTextFielType.cellPhoneField ||
        type == enmTextFielType.user_register ||
        type == enmTextFielType.homePhoneField ||
        type == enmTextFielType.agtsPhoneField ||
        type == enmTextFielType.amonutField ||
        type == enmTextFielType.kod ||
        type == enmTextFielType.weightField ||
        type == enmTextFielType.trek ||
        type == enmTextFielType.abonetTelefon ||
        type == enmTextFielType.waterM3 ||
        type == enmTextFielType.energykWt ||
        type == enmTextFielType.waterId ||
        type == enmTextFielType.gazId ||
        type == enmTextFielType.communalId ||
        type == enmTextFielType.electroId) {
      return TextInputType.number;
    } else {
      return TextInputType.text;
    }
  }

  static TextCapitalization capitalization(enmTextFielType type) {
    if (type == enmTextFielType.cellPhoneField ||
        type == enmTextFielType.homePhoneField ||
        type == enmTextFielType.user_register ||
        type == enmTextFielType.agtsPhoneField) {
      return TextCapitalization.none;
    } else if (type == enmTextFielType.carNumField ||
        type == enmTextFielType.homeAddress) {
      return TextCapitalization.none;
    } else if (type == enmTextFielType.vidoePhotopay) {
      return TextCapitalization.characters;
    } else {
      return TextCapitalization.words;
    }
  }

  static final maskCardNumber = MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
  static final maskExpireDay =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  static final maskCVC =
      MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});
  static final maskCellPhone = MaskTextInputFormatter(
      mask: '+(993) ##-##-##-##', filter: {"#": RegExp(r'[0-9]')});
  static final maskRegister = MaskTextInputFormatter(
      mask: '+(993) ##-##-##-##', filter: {"#": RegExp(r'[0-9]')});
  static final maskHomePhone = MaskTextInputFormatter(
      mask: '+(993) ##-##-##-##', filter: {"#": RegExp(r'[0-9]')});
  static final maskAbonentPhone = MaskTextInputFormatter(
      mask: '№ ##########', filter: {"#": RegExp(r'[0-9]')});
  static final maskCode =
      MaskTextInputFormatter(mask: '#####', filter: {"#": RegExp(r'[0-9]')});
  static final maskAGTSPhone = MaskTextInputFormatter(
      mask: '+(993) 12-##-##-##', filter: {"#": RegExp(r'[0-9]')});

  // static final maskCarNumber = MaskTextInputFormatter(
  //     mask: 'AA #### AA',
  //     filter: {"#": RegExp(r'[0-9]'), "A": RegExp(r'[a-zA-Z]')});
  static final maskCarTicket =
      MaskTextInputFormatter(mask: '#######', filter: {"#": RegExp(r'[0-9]')});
  static final maskPayAmount =
      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'));
  static final maskCarVideoPhotoPay = MaskTextInputFormatter(
    mask: '##/AA#######',
    filter: {"#": RegExp(r'[0-9]'), "A": RegExp(r'[A-Z]')},
  );
}

abstract class FrontStyles {
  static InputDecoration inputTypeDecoration(
      enmTextFielType type, Widget? suffix,
      {String? labelText}) {
    if (type == enmTextFielType.surnameField) {
      return inputDecoration(
        labelText ?? Strings.title(type),
        Strings.iconData(type),
      );
    }
    if (type == enmTextFielType.amonutField) {
      return inputDecoration(Strings.title(type), Strings.iconData(type),
          suffixText: LocaleKeys.manat, suffix: suffix);
    }
    if (type == enmTextFielType.weightField) {
      return inputDecoration(Strings.title(type), Strings.iconData(type),
          suffixText: LocaleKeys.kg, suffix: suffix);
    }
    if (type == enmTextFielType.cellPhoneField) {
      BuildContext? context;
      return inputDecoration(
        Strings.title(type),
        Strings.iconData(type),
        hintText: '+(993) xx-xx-xx-xx',
        // suffixText: controller.phoneNumber,
        suffix: suffix,
      );
    }
    if (type == enmTextFielType.user_register) {
      BuildContext? context;
      return inputDecoration(
        Strings.title(type),
        Strings.iconData(type),
        hintText: '+(993) xx-xx-xx-xx',
        // suffixText: controller.phoneNumber,
        suffix: suffix,
      );
    }
    if (type == enmTextFielType.homePhoneField) {
      return inputDecoration(Strings.title(type), Strings.iconData(type),
          hintText: '+(993) xx-xx-xx-xx', suffix: suffix);
    }
    if (type == enmTextFielType.abonetTelefon) {
      return inputDecoration(Strings.title(type), Strings.iconData(type),
          hintText: '№ XXXXXXXXXX', suffix: suffix);
    }
    if (type == enmTextFielType.agtsPhoneField) {
      return inputDecoration(Strings.title(type), Strings.iconData(type),
          hintText: '+(993) 12-xx-xx-xx', suffix: suffix);
    }
    if (type == enmTextFielType.waterM3) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(LocaleKeys.m3.tr));
    }
    if (type == enmTextFielType.energykWt) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(LocaleKeys.kwt.tr));
    }
    if (type == enmTextFielType.utils) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(LocaleKeys.kwt.tr));
    }
    if (type == enmTextFielType.gazM3) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(
            LocaleKeys.m3.tr,
          ));
    }
    if (type == enmTextFielType.description) {
      return inputDecoration(Strings.title(type), Strings.iconData(type),
          alignLabelWithHint: true, suffix: suffix);
    }
    if (type == enmTextFielType.password ||
        type == enmTextFielType.confPassword) {
      InitializerController controller = Get.put(InitializerController());
      return inputDecoration(
        Strings.title(type),
        Strings.iconData(type),
        suffixIcon: Obx(
          () => IconButton(
            onPressed: () => controller.pasVisibilty(),
            icon: controller.hidePassword.value
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
          ),
        ),
      );
    }
    if (type == enmTextFielType.ticket_from) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(LocaleKeys.from.tr));
    }
    if (type == enmTextFielType.ticket_to) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(LocaleKeys.to.tr));
    }
    if (type == enmTextFielType.ticket_arrival) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(LocaleKeys.arrival.tr));
    }
    if (type == enmTextFielType.ticket_depature) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(LocaleKeys.departure.tr));
    }
    if (type == enmTextFielType.ticket_passengers) {
      return inputDecoration(labelText, Strings.iconData(type),
          suffix: Text(LocaleKeys.passenger.tr));
    }
    return inputDecoration(Strings.title(type), Strings.iconData(type),
        suffix: suffix);
  }

  static InputDecoration inputDecoration(
    String? labelText,
    Icon? icon, {
    String? prefix,
    String? helperText,
    Widget? suffix,
    String? suffixText,
    String? hintText,
    Widget? suffixIcon,
    bool? alignLabelWithHint,
  }) {
    return InputDecoration(
      hintText: hintText,
      suffixText: suffixText,
      suffix: suffix,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      helperText: helperText,
      labelText: labelText,
      labelStyle: TextStyle(
          color: Theme.of(Get.context!).primaryColor.withOpacity(0.5)),
      alignLabelWithHint: alignLabelWithHint,
      filled: true,
      hintStyle: Theme.of(Get.context!).textTheme.bodyText1,
      prefixText: prefix,
      prefixIcon: icon,
      prefixIconConstraints: BoxConstraints(minWidth: 40),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(Get.context!).primaryColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: Theme.of(Get.context!).primaryColor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(Get.context!).errorColor)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black)),
    );
  }
}

class Spaces {
  static EdgeInsetsGeometry get verticalPpadding =>
      EdgeInsets.symmetric(horizontal: 30.0.w);

  static Padding horizontal(Widget child) => Padding(
        padding: verticalPpadding,
        child: child,
      );

  static Padding get mediumVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 16.0));

  static Padding get smallVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 8.0));
}

//Check contacts permission
_getPermission() {
  // Map<Permission, PermissionStatus> statuses = await [
  //   Permission.contacts,
  //   //add more permission to request here.
  // ].request();
  // if (statuses[Permission.contacts]!.isGranted) {
  //   //check each permission status after.
  //   print("Location permission is denied.");
  //   // Get.to(() => ContactPickerScreen());
  // }
  Get.find<InitializerController>().pasVisibilty();
  print(Get.find<InitializerController>().hidePassword);
}
