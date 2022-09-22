import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/app/modules/controllers/initializer_controller.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/utils/enums.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InfoUpdater extends GetView<HomeController> {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _homephoneController = TextEditingController();
  final TextEditingController _gazController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();
  final TextEditingController _carNumController = TextEditingController();
  final TextEditingController _electroController = TextEditingController();
  final TextEditingController _communalController = TextEditingController();
  final TextEditingController _homeAddressController = TextEditingController();
  final GlobalKey<FormFieldState> _formName = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formSurname = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formCarNum = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formWater = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formGaz = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formElectro = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formCommunal = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formHomeAddress =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formHomePhoneNum =
      GlobalKey<FormFieldState>();
  InitializerController intializerController = Get.put(InitializerController());
  final enmTextFielType type;
  InfoUpdater(this.type);

  bool validateForm() {
    if (type == enmTextFielType.nameField) {
      return _formName.currentState!.validate();
    } else if (type == enmTextFielType.surnameField) {
      return _formSurname.currentState!.validate();
    } else if (type == enmTextFielType.carNumField) {
      return _formCarNum.currentState!.validate();
    } else if (type == enmTextFielType.homePhoneField) {
      return _formHomePhoneNum.currentState!.validate();
    } else {
      return true;
    }
  }

  getAuth() {
    intializerController
        .updateUserInfoFunction(
            _nameController.text,
            _surnameController.text,
            _homeAddressController.text,
            _carNumController.text,
            _waterController.text,
            _gazController.text,
            _electroController.text,
            _communalController.text)
        .then((value) {
      if (value) {
        Get.back();
      } else {
        _nameController.clear();
        _surnameController.clear();
        _carNumController.clear();
        _waterController.clear();
        _gazController.clear();
        _electroController.clear();
        _communalController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 20.w,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      body: Spaces.horizontal(
        Obx(() {
          return AnimatedContainer(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            duration: Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      LocaleKeys.fillAdditional.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  UIElements.customTextField(
                    key: _formName,
                    type: enmTextFielType.nameField,
                    textController: _nameController,
                    autoFocux: type == enmTextFielType.nameField,
                  ),
                  UIElements.customTextField(
                    key: _formSurname,
                    type: enmTextFielType.surnameField,
                    textController: _surnameController,
                    autoFocux: type == enmTextFielType.surnameField,
                  ),
                  UIElements.customTextField(
                      key: _formCarNum,
                      type: enmTextFielType.carNumField,
                      textController: _carNumController,
                      autoFocux: type == enmTextFielType.carNumField,
                      onChanging: (val) {
                        _carNumController.value = TextEditingValue(
                            text: val.toUpperCase(),
                            selection: _carNumController.selection);
                      }),
                  UIElements.customTextField(
                    key: _formHomeAddress,
                    type: enmTextFielType.homeAddress,
                    textController: _homeAddressController,
                    autoFocux: type == enmTextFielType.homeAddress,
                  ),
                  UIElements.customTextField(
                    key: _formWater,
                    type: enmTextFielType.waterId,
                    textController: _waterController,
                    autoFocux: type == enmTextFielType.waterId,
                  ),
                  UIElements.customTextField(
                    key: _formGaz,
                    type: enmTextFielType.gazId,
                    textController: _gazController,
                    autoFocux: type == enmTextFielType.gazId,
                  ),
                  UIElements.customTextField(
                    key: _formElectro,
                    type: enmTextFielType.electroId,
                    textController: _electroController,
                    autoFocux: type == enmTextFielType.electroId,
                  ),
                  UIElements.customTextField(
                    key: _formCommunal,
                    type: enmTextFielType.communalId,
                    textController: _communalController,
                    autoFocux: type == enmTextFielType.communalId,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: FloatingActionButton.extended(
                      isExtended: true,
                      onPressed: () => getAuth(),
                      label: controller.userUpdate.value
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                              LocaleKeys.confr.tr,
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
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
