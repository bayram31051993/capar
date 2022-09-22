import 'package:badges/badges.dart';
import 'package:capar/app/data/api/GetAllFines/get_all_fines.dart';
import 'package:capar/app/data/models/GetAllRadarFinesModel/get_all_radar_view_model.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/core/apperience/theme.dart';
import 'package:capar/core/values/globals.dart';
import 'package:capar/core/values/strings.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RadarController extends GetxController {
  final isFetchError = false.obs;
  final isLoading = false.obs;
  final selectedIndex = 0.obs;
  GetAllFinesPost _finesProvider = GetAllFinesPost();
  Rx<GetAllPygg> fines = GetAllPygg().obs;
  final GetAllPygg _createGetAllPygg = GetAllPygg();
  GetAllFinesPost getAllPyggPost = GetAllFinesPost();
  HomeController homeController = Get.put(HomeController());
  List<Car> allFines = [];
  List<Car> unpaidFines = [];
  List<Car> paidFines = [];
  @override
  void onInit() async {
    loadFine();
    super.onInit();
  }

  selecChange(int index) {
    selectedIndex.value = index;
    if (index == 0) {
      fines.update((val) {
        val!.detail!.loc![0].car = allFines;
      });
    }
    // if (index == 1) {
    //   fines.update((val) {
    //     val!.car = unpaidFines;
    //   });
    // }
    // if (index == 2) {
    //   fines.update((val) {
    //     val!.car = paidFines;
    //   });
    // }
  }

  sortUp() {
    fines.update(
      (val) {
        val!.detail!.loc![0].sortUp();
      },
    );
  }

  sortDown() {
    fines.update(
      (val) {
        val!.detail!.loc![0].sortDown();
      },
    );
  }

  searchType(String letter) {
    if (letter == "") {
      selectedIndex.value = 0;
      removeSearch();
      return;
    }
    var sorted =
        allFines.where((element) => element.karar!.startsWith(letter)).toList();
    fines.update(
      (val) {
        val!.detail!.loc![0].car = sorted;
      },
    );
  }

  removeSearch() {
    fines.update(
      (val) {
        val!.detail!.loc![0].car = allFines;
      },
    );
  }

  loadFine() async {
    isFetchError(false);
    var cabinetController = Get.find<HomeController>();
    var carNumber = cabinetController.cabinetInitialize.value.detail != null
        ? cabinetController.cabinetInitialize.value.detail!.loc![0].crn
        : "null";
    if (carNumber!.isEmpty) return;
    isLoading(true);
    var responce = await _finesProvider.getAllPyggpost(
        homeController.cabinetInitialize.value.detail!.loc![0].crn);
    if (responce != null) {
      fines.value = responce;
      allFines = responce.detail!.loc![0].car!;
      unpaidFines = responce.detail!.loc![0].unpaid;
      paidFines = responce.detail!.loc![0].paid;
    } else {
      isFetchError(true);
    }
    isLoading(false);
  }

  @override
  void onClose() {}
}
