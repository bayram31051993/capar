import 'package:capar/core/values/constants.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => LoginScreen());
              },
              child: Text(
                LocaleKeys.login.tr,
              ),
            ),
          ),
        ),
        // const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => SignUpScreen());
            },
            style: ElevatedButton.styleFrom(
                primary: kPrimaryLightColor, elevation: 0),
            child: Text(
              LocaleKeys.signUp.tr,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
