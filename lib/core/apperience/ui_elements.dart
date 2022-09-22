import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../utils/enums.dart';
import '../utils/suggestor.dart';
import '../values/assets.dart';
import '../values/strings.dart';
import '../values/styles.dart';

abstract class UIElements {
  static Widget customTextField(
      {required enmTextFielType type,
      required TextEditingController textController,
      InputDecoration? decoration,
      bool enabled = true,
      TextInputAction textInputAction = TextInputAction.next,
      Key? key,
      Widget? suffix,
      String? lableText,
      bool? autoFocux,
      int? length,
      Function(String)? onChanging,
      bool hidenText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: TypeAheadFormField(
        key: key,
        hideOnEmpty: true,
        textFieldConfiguration: TextFieldConfiguration(
          obscureText: hidenText,
          onChanged: onChanging,
          maxLength: length,
          autofocus: autoFocux ?? false,
          inputFormatters: [TextInputStyles.maskFilter(type)],
          textCapitalization: TextInputStyles.capitalization(type),
          textInputAction: textInputAction,
          enabled: enabled, style: Theme.of(Get.context!).textTheme.bodyText1,
          keyboardType: TextInputStyles.keyboardType(type),
          //maxLines: type == enmTextFielType.description ? 3 : 1,
          // maxLengthEnforced: false,
          controller: textController,
          decoration: decoration ??
              FrontStyles.inputTypeDecoration(type, suffix,
                  labelText: lableText),
        ),
        suggestionsCallback: (pattern) {
          var typeT = Strings.enmConvertor(type);
          if (typeT == enmStorageKeys.none) return [];
          return Suggestor.returnSuggestions(typeT, pattern)  ;
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.toString()),
          );
        },
        transitionBuilder: (context, suggestionsBox, controller) {
          return suggestionsBox;
        },
        onSuggestionSelected: (suggestion) {
          textController.text = suggestion.toString();
        },
        validator: (value) {
          return Strings.validator(type, value);
        },
        onSaved: (value) =>
            textController.text = value ?? '', //_selectedCity = value!,
      ),
    );
  }

  static Widget dateButton(
      {required Function() onPressed,
      required String text,
      bool forDate = true}) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: Theme.of(Get.context!).primaryColor,
          ),
          primary: Colors.black87,
          backgroundColor:
              Theme.of(Get.context!).primaryColor.withOpacity(0.03),
          minimumSize: const Size(88, 36),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Row(
          children: [
            Icon(
              forDate ? Icons.date_range_rounded : Icons.timer_sharp,
              color: Theme.of(Get.context!).primaryColor,
            ),
            SizedBox(width: 5.w),
            Text(
              text,
              style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
                    color: Theme.of(Get.context!).primaryColor.withOpacity(0.5),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget dropBox(Widget child) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        color: Theme.of(Get.context!).colorScheme.secondary,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: DropdownButtonHideUnderline(child: child),
      ),
    );
  }

  static Widget dropContainer(Widget child) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Theme.of(Get.context!).colorScheme.secondary,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: DropdownButtonHideUnderline(child: child),
      ),
    );
  }

  static Widget floatingButton(
      {required Function() onPressed, required Widget title}) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: FloatingActionButton.extended(
        isExtended: true,
        onPressed: onPressed,
        label: title,
      ),
    );
  }

  static Widget simpleTextField({
    required enmTextFielType type,
    required TextEditingController textController,
    InputDecoration? decoration,
    bool enabled = true,
    TextInputAction textInputAction = TextInputAction.next,
    Key? key,
    Widget? suffix,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: TextFormField(
        // cursorHeight: 45.h,
        key: key,
        textAlign: textAlign,
        inputFormatters: [
          TextInputStyles.maskFilter(type),
        ],
        textCapitalization: TextInputStyles.capitalization(type),
        textInputAction: textInputAction,
        enabled: enabled,
        keyboardType: TextInputStyles.keyboardType(type),
        controller: textController,
        decoration: decoration ?? FrontStyles.inputTypeDecoration(type, suffix),
        validator: (value) {
          return Strings.validator(type, value);
        },
        // onChanged: (val) {
        //   if (type == enmTextFielType.amonutField) {
        //     var d = double.tryParse(val) ?? 0.00;
        //     textController.text = TextInputStyles.formatCurrency.format(d);
        //     //textController.text = TextInputStyles.moneyFormat(val);
        //   }
        // },
      ),
    );
  }

  static Widget tolegItemLogo(enmPaymentType type) {
    Widget rezult = SizedBox();
    switch (type) {
      case enmPaymentType.pygg:
        break;
      // case enmPaymentType.tmTelekom:
      //   rezult = Image.asset(
      //     MyAssetsImages.pngLogoTelekom,
      //     fit: BoxFit.contain,
      //   );
      //   break;
      // case enmPaymentType.tmCell:
      //   rezult = Image.asset(
      //     MyAssetsImages.pngLogoTmCell,
      //     fit: BoxFit.contain,
      //   );
      //   break;
      // case enmPaymentType.agtsInternet:
      //   rezult = Image.asset(
      //     MyAssetsImages.pngLogoAgts,
      //     fit: BoxFit.contain,
      //   );
      //   break;
      // case enmPaymentType.agtsTelefon:
      //   rezult = Image.asset(
      //     MyAssetsImages.pngLogoAgts,
      //     fit: BoxFit.contain,
      //   );
      //   break;
      // case enmPaymentType.agtsIpTv:
      //   rezult = Image.asset(
      //     MyAssetsImages.pngLogoAgts,
      //     fit: BoxFit.contain,
      //   );
      //   break;
      // case enmPaymentType.telecomTV:
      //   rezult = Image.asset(
      //     MyAssetsImages.pngLogoAgts,
      //     fit: BoxFit.contain,
      //   );
      //   break;
      // case enmPaymentType.cabelTV:
      //   rezult = Image.asset(
      //     MyAssetsImages.pngLogoAgts,
      //     fit: BoxFit.contain,
      //   );
      // //   break;
      // case enmPaymentType.water:
      //   break;
      // case enmPaymentType.electro:
      //   break;
      // case enmPaymentType.utils:
      //   break;
      // case enmPaymentType.student:
      //   break;
      // case enmPaymentType.migration:
      //   break;
      // case enmPaymentType.licese:
      //   break;
      default:
    }
    return rezult;
  }

  static Widget extendenField({required Widget icon, required Widget child}) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 50.h),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(Get.context!).primaryColor,
          ),
          borderRadius: BorderRadius.circular(30.r),
          color: Theme.of(Get.context!).primaryColor.withOpacity(0.03),
        ),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Theme.of(Get.context!).primaryColor,
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
