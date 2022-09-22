import 'package:capar/app/modules/pages/CarFines/elements/radar_app_bar.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VideoPhotoFines extends StatefulWidget {
  const VideoPhotoFines({Key? key}) : super(key: key);

  @override
  State<VideoPhotoFines> createState() => _VideoPhotoFinesState();
}

class _VideoPhotoFinesState extends State<VideoPhotoFines> {
  final TextEditingController protocolNumber = TextEditingController();
  final TextEditingController payAmount = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _car = TextEditingController();

  Widget textElements(type, controller) {
    return UIElements.customTextField(type: type, textController: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RadarAppBar(),
      body: SingleChildScrollView(
        child: Spaces.horizontal(Column(
          children: [
            textElements(enmTextFielType.vidoePhotopay, protocolNumber),
            textElements(enmTextFielType.nameField, _name),
            textElements(enmTextFielType.surnameField, _surname),
            textElements(enmTextFielType.carNumField, _car),
            textElements(enmTextFielType.amonutField, payAmount),
            SizedBox(
              height: 15.h,
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text(
                LocaleKeys.payWithCard.tr,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey.shade200,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )),
      ),
    );
  }
}
