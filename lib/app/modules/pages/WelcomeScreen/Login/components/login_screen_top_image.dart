import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/constants.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(MyAssetsImages.loginImg),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
