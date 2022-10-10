import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/controllers/radar_controller.dart';
import 'package:capar/app/modules/controllers/ticket_controller.dart';
import 'package:capar/app/modules/controllers/tolegler_controller.dart';
import 'package:capar/app/modules/controllers/trek_controller.dart';
import 'package:get/get.dart';

class InitializerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitializerController>(
      () => InitializerController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    // Get.lazyPut<CaparController>(
    //   () => CaparController(),
    //   fenix: true,
    // );
    Get.lazyPut<ToleglerController>(
      () => ToleglerController(),
      fenix: true,
    );
    // Get.lazyPut<SmsLoginProvider>(
    //   () => SmsLoginProvider(),
    //   fenix: true,
    // );

    // Get.lazyPut<AdministrativesProvider>(
    //   () => AdministrativesProvider(),
    //   fenix: true,
    // );
    Get.lazyPut<RadarController>(
      () => RadarController(),
      fenix: true,
    );
    Get.lazyPut<TrekController>(
      () => TrekController(),
      fenix: true,
    );
    Get.lazyPut<TicketController>(
      () => TicketController(),
      fenix: true,
    );
    // Get.lazyPut<PaymentController>(
    //   () => PaymentController(),
    //   fenix: true,
    // );
    // Get.lazyPut<TrekController>(
    //   () => TrekController(),
    //   fenix: true,
    // );
    // Get.lazyPut<CaparHistoryController>(
    //   () => CaparHistoryController(),
    //   fenix: true,
    // );
    // Get.lazyPut<CardController>(
    //   () => CardController(),
    //   fenix: true,
    // );
  }
}
