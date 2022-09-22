import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/app/modules/pages/WelcomeScreen/components/already_have_an_account_acheck.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/values/constants.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';
import '../../Login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _formPhone = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _pass = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _confPass = GlobalKey<FormFieldState>();
  InitializerController controller = Get.put(InitializerController());

  @override
  void initState() {
    // getUserSms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 30),
          child: Column(
            children: [
              Text(
                LocaleKeys.signUp.tr,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              UIElements.customTextField(
                  textController: controller.phoneNumber,
                  key: _formPhone,
                  type: enmTextFielType.user_register,
                  length: 8),
              Column(
                children: [
                  UIElements.customTextField(
                      textController: controller.pass,
                      key: _pass,
                      type: enmTextFielType.password,
                      hidenText: controller.hidePassword.value),
                  SizedBox(
                    height: 15,
                  ),
                  UIElements.customTextField(
                    textController: controller.confPass,
                    key: _confPass,
                    type: enmTextFielType.confPassword,
                    hidenText: controller.hidePassword.value,
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Visibility(
                visible: controller.show_code_field.value,
                child: Container(
                    child: controller.future_get_sms_code_model == null
                        ? Container()
                        : controller.buildCodeField()),
              ),
              const SizedBox(height: defaultPadding / 2),
              Center(
                child: controller.future_confirm_sms_model == null
                     
                    ? Column(
                        children: [
                          ElevatedButton(
                            onPressed: ()  {
                              if (_formKey.currentState!.validate()) {
                                if (controller.hide_get_code_btn.value) {
                                  controller.getCodeRequest(context);
                                } else {
                                  controller.sendSmsCode();
                                }
                              }
                            },
                            child: controller.hide_get_code_btn.value
                                ? Text(LocaleKeys.getCode.tr)
                                : Text(LocaleKeys.signUp.tr),
                          ),
                        ],
                      )
                      : controller.buildFutureconfSms()
              ),
              const SizedBox(height: defaultPadding),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Get.to(() => LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void getUserSms() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   controller.sms_id = preferences.getInt("sms_id"); //controller nirden gelya?

  //   setState(() {
  //     // controller.sms_id = controller.getSmsCodeModel!.detail.loc[0].smsId;
  //   });
  // }
}
