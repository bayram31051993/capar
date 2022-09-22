import 'package:capar/app/data/models/TicketsUserModel/tikcets_user_model.dart';
import 'package:capar/app/modules/controllers/passengers_controller.dart';
import 'package:capar/app/modules/controllers/ticket_controller.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddPassengers extends StatefulWidget {
  String? appBarTittle;
  TicketPassengersModel? passengersModel;
  AddPassengers(this.passengersModel, this.appBarTittle, {Key? key})
      : super(key: key);
  @override
  State<AddPassengers> createState() {
    return _AddPassengersState(this.passengersModel!, this.appBarTittle!);
  }
}

class _AddPassengersState extends State<AddPassengers> {
  PassengersController controller = Get.put(PassengersController());
  TicketController controllers = Get.put(TicketController());
  TextEditingController firstName = TextEditingController();
  TextEditingController lasttName = TextEditingController();
  TextEditingController docNum = TextEditingController();
  TextEditingController biRthday = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  bool male = false;
  bool fMale = false;
  String appBarTittle;

  TicketPassengersModel? passengersModel;
  late List<TicketPassengersModel> passengersMap;
  _AddPassengersState(this.passengersModel, this.appBarTittle);
  @override
  void initState() {
    // savePassengers();
    super.initState();
  }

  void savePassengers() {
    debugPrint(passengersModel.toString());
    // if (!_keyForm.currentState!.validate()) return;
    var fName = firstName.text;
    controller.passengersUpdate(fName: fName);
    controller.addPassengersToList();
    setState(() {
      if (male == true) {
        passengersModel!.gender = LocaleKeys.male.tr;
      } else if (fMale == true) {
        passengersModel!.gender = LocaleKeys.fMale.tr;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    firstName.text = passengersModel!.firstName.toString();
    lasttName.text = passengersModel!.lstName.toString();
    docNum.text = passengersModel!.docNum.toString();
    biRthday.text = passengersModel!.bDate.toString();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 5.w),
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              appBarTittle,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(child: addPassengers()),
    );
  }

  Container addPassengers() {
    return Container(
      child: Spaces.horizontal(Column(
        children: [
          Container(
            child: Text(
              LocaleKeys.chooseGender.tr,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      activeColor: Theme.of(context).primaryColor,
                      value: male,
                      onChanged: (value) {
                        setState(() {
                          male = value!;
                          fMale = false;
                        });
                      }),
                  Text(
                    LocaleKeys.male.tr,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Row(
                children: [
                  Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      activeColor: Theme.of(context).primaryColor,
                      value: fMale,
                      onChanged: (value) {
                        setState(() {
                          fMale = value!;
                          male = false;
                        });
                      }),
                  Text(
                    LocaleKeys.fMale.tr,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: TextFormField(
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return LocaleKeys.mustntEmpty.tr;
                }
              },
              controller: firstName,
              style: TextStyle(fontSize: 18.sp),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: LocaleKeys.name.tr,
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15.sp,
                ),
                border: InputBorder.none,
                fillColor: Colors.transparent,
              ),
              onChanged: (value) {
                passengersModel!.firstName = firstName.text;
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: lasttName,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return LocaleKeys.mustntEmpty.tr;
                }
              },
              style: TextStyle(fontSize: 18.sp),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: LocaleKeys.surname.tr,
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15.sp,
                ),
                border: InputBorder.none,
                fillColor: Colors.transparent,
              ),
              onChanged: (value) {
                passengersModel!.lstName = lasttName.text;
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: docNum,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return LocaleKeys.mustntEmpty.tr;
                }
              },
              style: TextStyle(fontSize: 18.sp),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.document_scanner,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: LocaleKeys.numDoc.tr,
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15.sp,
                ),
                border: InputBorder.none,
                fillColor: Colors.transparent,
              ),
              onChanged: (value) {
                passengersModel!.docNum = docNum.text;
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            onTap: () {
              controllers.chooseBrithDay(biRthday);
            },
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              child: TextFormField(
                enabled: false,
                controller: biRthday,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return LocaleKeys.mustntEmpty.tr;
                  }
                },
                keyboardType: TextInputType.datetime,
                style: TextStyle(fontSize: 18.sp),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                  ),
                  labelText: LocaleKeys.birthDay.tr,
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15.sp,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                ),
                onChanged: (value) {
                  setState(() {
                    passengersModel!.bDate = biRthday.text;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
            onPressed: () {
              savePassengers();
            },
            child: Text(
              LocaleKeys.save.tr,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade200),
            ),
          ),
        ],
      )),
    );
  }
}
