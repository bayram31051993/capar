import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(MyAssetsImages.signUpImg),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
