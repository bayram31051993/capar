import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Çapar Programmamyza hoş geldiňiz",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(
                MyAssetsImages.welcomeImg,
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}