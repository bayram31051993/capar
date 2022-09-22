import 'package:capar/app/modules/controllers/initializer_controller.dart';
// import 'package:capar/app/modules/pages/InitializerView/initializer_view.dart';
import 'package:capar/app/modules/pages/WelcomeScreen/WeolcomePage/welcome_screen.dart';
import 'package:capar/app/modules/pages/WelcomeScreen/components/already_have_an_account_acheck.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:capar/core/values/constants.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Signup/signup_screen.dart';

class LoginForm extends GetView<InitializerController> {
  final GlobalKey<FormFieldState> _formPhone = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _pass = GlobalKey<FormFieldState>();

  LoginForm({Key? key}) : super(key: key);

  void getAuth() {
    controller.registrationFunction().then((value) {
      if (value) {
        debugPrint("Token in Login: ${controller.token.value.toString()}");
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.login.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    UIElements.customTextField(
                        textController: controller.phoneNumber,
                        key: _formPhone,
                        type: enmTextFielType.user_register,
                        length: 8),
                    Obx(
                      () => UIElements.customTextField(
                          textController: controller.pass,
                          key: _pass,
                          type: enmTextFielType.password,
                          hidenText: controller.hidePassword.value),
                    ),
                    const SizedBox(height: defaultPadding),
                    Hero(
                      tag: "login_btn",
                      child: ElevatedButton(
                        onPressed: () {
                          getAuth();
                        },
                        child: controller.authRequestSending.value
                            ? Center(
                              child: Container(
                                  height: 15.h,
                                  width: 15.w,
                                  child:const CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                            )
                            : Text(
                                LocaleKeys.login.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade200),
                              ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Get.to(() => const SignUpScreen());
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
