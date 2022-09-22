import 'package:capar/app/modules/bindings/initializer_binding.dart';
import 'package:capar/app/modules/pages/InitializerView/initializer_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.initializer;

  static final routes = [
    GetPage(
      name: _Paths.initializer,
      page: () => InitializerView(),
      binding: InitializerBinding(),
    ),
    // GetPage(
    //   name: _Paths.departmets,
    //   page: () => DepartmentsView(),
    //   binding: DepartmentsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.trek,
    //   page: () => MoveTrackView(),
    //   binding: MoveTrackBinding(),
    // ),
  ];
}