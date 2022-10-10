// ignore_for_file: unnecessary_null_comparison, depend_on_referenced_packages

import 'dart:convert';

import 'package:capar/app/data/api/Cabinet/cabinet_request.dart';
import 'package:capar/app/data/api/UpdateUsrInfo/update_user_info_request.dart';
import 'package:capar/app/data/models/CabinetMOdel/cabinet_model.dart';
import 'package:capar/app/data/models/CabinetMOdel/custom_cabinet.dart';
import 'package:capar/app/data/models/CardsModel/cards_model.dart';
import 'package:capar/app/data/models/UpdateUsrInfoModel/update_usr_info_model.dart';
import 'package:capar/app/data/services/packages/fab_menu.dart';
import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:capar/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  SharedPreferences? preferences;
  final selectedIndexTab = 0.obs;
  //RxList app yapylyanca yatda saklaya, app yapylyp acylandan son yitya
  // Eger hemiselik saklajak bolsan ya SharedPref'de yada sqflite diyip package bar. shonda saklamaly.
  // her app acylanda, yada yanky card screen acylanda RxList'e yuklemeli
  // CreditCard model bilen baglansygy yok!
  // Shu asakdakyny comment edip nirde error beryani gormeli, yagny nirde ulanyldy
  final RxList<CreditCard> cards = <CreditCard>[].obs;
  final cabinetInitialize = CabinetModel().obs;
  final getCabinetPost = Get.put(CabinetRequest());
  final isLoading = false.obs;
  final userUpdate = false.obs;
  CabinetModel? cabinetModel;
  // final showCabBadge = true.obs;

  @override
  onInit() {
    getCabinetValue();
    super.onInit();

    List<String>? all = PrvStorage().getListValues(enmStorageKeys.cardList);
    debugPrint('all $all');
    if (all != null && all.isNotEmpty) {
      for (var element in all) {
        final CreditCard cc = CreditCard.fromJson(json.decode(element));

        cards.add(cc);
        debugPrint('credit card $cc');
      }
    }
  }

  Rx<CustomCabinet> customCabinet = CustomCabinet(
    id: "",
    accessToken: "",
  ).obs;

  closeFab() {
    if (fabKey.currentState!.isOpen) {
      fabKey.currentState!.close();
    }
  }

  openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  getCabinetValue() async {
    cabinetInitialize.value = await getCabinetPost.getCabinet();
  }

  logOut() async {
    Get.back();
    preferences = await SharedPreferences.getInstance();
    preferences!.remove('token');
    Get.find<InitializerController>().token.value = '';
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Get.find<InitializerController>().loadInitials(),
    );
  }

  bool showCabBadge() {
    if (cabinetInitialize.value.detail != null) {
      if (cabinetInitialize.value.detail!.loc![0].frn! == '-' ||
          cabinetInitialize.value.detail!.loc![0].frn! == '' ||
          cabinetInitialize.value.detail!.loc![0].lsn! == '-' ||
          cabinetInitialize.value.detail!.loc![0].lsn! == '' ||
          cabinetInitialize.value.detail!.loc![0].crn! == '-' ||
          cabinetInitialize.value.detail!.loc![0].crn! == '' ||
          cabinetInitialize.value.detail!.loc![0].add! == '-' ||
          cabinetInitialize.value.detail!.loc![0].add! == '' ||
          cabinetInitialize.value.detail!.loc![0].fon! == '-' ||
          cabinetInitialize.value.detail!.loc![0].fon! == '') {
        // showCabBadge(true);
        return true;
      }
      return false;
    } else {
      return true;
    }
  }

  deletCard(CreditCard card) {
    isLoading(true);
    cards.remove(card);
    //await PrvDB.deleteRow('cards', card.id);
    var str = jsonEncode(card.toJson());
    PrvStorage().delFromList(enmStorageKeys.cardList, str);
    isLoading(false);
  }

  addCard(CreditCard card) {
    isLoading(true);
    card.name = Strings.pathToBankCard(card.bind)['name'];
    cards.add(card);
    var str = jsonEncode(card.toJson());
    PrvStorage().addToList(enmStorageKeys.cardList, str);
    isLoading(false);
  }
}
