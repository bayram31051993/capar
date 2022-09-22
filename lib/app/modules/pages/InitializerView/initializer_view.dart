import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/Home/hom_view.dart';
import 'package:capar/app/modules/pages/WelcomeScreen/Login/login_screen.dart';
import 'package:capar/app/modules/pages/WelcomeScreen/WeolcomePage/welcome_screen.dart';
import 'package:capar/core/utils/save_user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class InitializerView extends StatefulWidget {
  const InitializerView({Key? key}) : super(key: key);

  @override
  State<InitializerView> createState() => _InitializerViewState();
}

class _InitializerViewState extends State<InitializerView> {
  late InitializerController controller;
  @override
  void initState() {
    controller = Get.put(InitializerController());
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    debugPrint("Initializer View Token: ${controller.token.value.toString()}");

    return Obx(
      () {
        // error
        if (controller.checkToken) {
          debugPrint('in if');
          // Get.to(() => HomeView());
          return HomeView(); //isledip gor h
        } else {
          print(controller.token);
          debugPrint('in else'); //
          //  Get.to(()=> LoginScreen());
          return const WelcomeScreen();
        }
      },
    );
  }

  void getToken() async {
    final prefs = await SharedPreferences.getInstance();
    controller.token.value = prefs.getString("token")!;
    setState(() {});
  }
}
