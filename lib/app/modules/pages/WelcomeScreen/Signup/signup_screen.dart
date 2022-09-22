import 'package:capar/app/modules/pages/WelcomeScreen/components/background.dart';
import 'package:capar/core/values/constants.dart';
import 'package:capar/core/values/responsive.dart';
import 'package:flutter/material.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileSignupScreen(),
          desktop: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: SignUpScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: SignUpForm(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Spacer(),
              Expanded(
                flex: 8,
                child: SignUpForm(),
              ),
            ],
          ),
          
          const SignUpScreenTopImage(),
          // const SocalSignUp()
        ],
      ),
    );
  }
}
