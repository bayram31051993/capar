import 'package:capar/core/values/constants.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? LocaleKeys.notAccount.tr : LocaleKeys.haveAccount.tr,
          style: const TextStyle(color: kPrimaryColor),
        ),
        SizedBox(
          width: 2.w,
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? LocaleKeys.signUp.tr : LocaleKeys.login.tr,
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
