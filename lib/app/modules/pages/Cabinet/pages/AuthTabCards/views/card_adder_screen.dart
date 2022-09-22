import 'package:capar/app/modules/controllers/card_controller.dart';
import 'package:capar/core/values/assets.dart';
import 'package:capar/core/values/strings.dart';
import 'package:capar/core/values/styles.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'cart_type/cart_type_item.dart';
import 'package:capar/core/utils/enums.dart';

class CardAdder extends GetView<CardController> {
  final TextEditingController _number = TextEditingController();
  final TextEditingController _expiry = TextEditingController();
  final TextEditingController _cardHolder = TextEditingController();
  final TextEditingController _cvc = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  CardController cardController = Get.put(CardController());
  saveCard() {
    if (!_keyForm.currentState!.validate() || !controller.validate()) return;
    var name = Strings.pathToBankCard(_number.text)['name'];
    controller.cardUpdate(name: name);
    controller.addCardToWallet();
  }

  showTypeChooser(BuildContext context) {
    //to avoid overflow bottom size
    FocusManager.instance.primaryFocus?.unfocus();
    Future.delayed(const Duration(milliseconds: 500)).then(
      (_) => Get.defaultDialog(
        title: "",
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          height: 400.h,
          width: 250.w,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: enmBankKartlar.values.length - 1,
            itemBuilder: (_, i) => CarTypeItem(
              enmBankKartlar.values[i],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 30.w,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              LocaleKeys.cardAdd.tr,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _keyForm,
          child: Spaces.horizontal(
            Obx(
              () => Column(
                children: [
                  SizedBox(height: 20.h),
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        image: DecorationImage(
                            image: AssetImage(
                              cardController.card.value.image.isEmpty
                                  ? MyAssetsImages.creditMock
                                  : cardController.card.value.image,
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 113.h),
                          SizedBox(
                            height: 30.h,
                            child: Row(
                              children: [
                                SizedBox(width: 25.w),
                                Text(
                                  cardController.card.value.number,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.grey.shade300,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                            child: Row(
                              children: [
                                const Spacer(),
                                Text(
                                  cardController.card.value.expiredDate,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                SizedBox(width: 25.w)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                            child: Row(
                              children: [
                                SizedBox(width: 25.w),
                                Center(
                                  child: Text(
                                    cardController.card.value.cardHolder
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                    child: TextFormField(
                      controller: _number,
                      inputFormatters: [TextInputStyles.maskCardNumber],
                      decoration: FrontStyles.inputDecoration(
                          LocaleKeys.cardNum.tr,
                          Icon(Icons.credit_card,
                              color: Theme.of(context).primaryColor),
                          hintText: 'XXXX XXXX XXXX XXXX'),
                      onChanged: (val) {
                        controller.cardUpdate(num: val);
                      },
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return LocaleKeys.mustntEmpty.tr;
                        }
                        if (val.length < 19) return LocaleKeys.notValid.tr;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                    child: TextFormField(
                      controller: _expiry,
                      inputFormatters: [TextInputStyles.maskExpireDay],
                      decoration: FrontStyles.inputDecoration(
                        LocaleKeys.expDate.tr,
                        Icon(
                          Icons.date_range,
                          color: Theme.of(context).primaryColor,
                        ),
                        hintText: 'XX/XX',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        controller.cardUpdate(expr: val);
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return LocaleKeys.mustntEmpty.tr;
                        }
                        var mm = int.tryParse(val.split('/').first);
                        if (mm == null || mm > 12) {
                          return '${val.split('/').first} ${LocaleKeys.notValid.tr}';
                        }
                        var yy = int.tryParse(val.split('/').last);
                        if (yy == null || yy < 20) {
                          return '${val.split('/').last} ${LocaleKeys.notValid.tr}';
                        }
                        return null;
                      },
                    ),
                  ),
                  cardController.typeIsNeeded.value
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 7.h),
                          height: 50.h,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => showTypeChooser(context),
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                width: cardController.isNotValidType.value ? 2 : 1,
                                color: cardController.isNotValidType.value
                                    ? Theme.of(Get.context!).errorColor
                                    : Theme.of(Get.context!).primaryColor,
                              ),
                              primary: Colors.black87,
                              backgroundColor: Theme.of(Get.context!)
                                  .primaryColor
                                  .withOpacity(0.03),
                              minimumSize: const Size(88, 36),
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_balance,
                                  color: cardController.isNotValidType.value
                                      ? Theme.of(Get.context!).errorColor
                                      : Theme.of(Get.context!).primaryColor,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  cardController.kartType.value,
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .bodyText1!,
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  if (cardController.cvcIsNeeded.value)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.h),
                      child: TextFormField(
                        controller: _cvc,
                        inputFormatters: [TextInputStyles.maskCVC],
                        decoration: FrontStyles.inputDecoration(
                            "CVC",
                            Icon(Icons.lock,
                                color: Theme.of(context).primaryColor),
                            hintText: 'CVC'),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          if (int.tryParse(val) != null) {
                            cardController.cardUpdate(cvc: val);
                          }
                        },
                        validator: (val) {
                          if (!cardController.cvcIsNeeded.value) return null;
                          if (val == null || val.isEmpty) {
                            return LocaleKeys.mustntEmpty.tr;
                          }
                          if (val.length != 3) {
                            return LocaleKeys.notValid.tr;
                          }
                          var mm = int.tryParse(val);
                          if (mm == null || mm.isNegative) {
                            return LocaleKeys.notValid.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                    child: TextFormField(
                      controller: _cardHolder,
                      decoration: FrontStyles.inputDecoration(
                        LocaleKeys.cardHoldr.tr,
                        Icon(Icons.person,
                            color: Theme.of(context).primaryColor),
                      ),
                      onChanged: (val) {
                        cardController.cardUpdate(holder: val);
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return LocaleKeys.mustntEmpty.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      heroTag: "CardAdd",
                      isExtended: true,
                      onPressed: () => saveCard(),
                      label: Text(
                        LocaleKeys.save.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
