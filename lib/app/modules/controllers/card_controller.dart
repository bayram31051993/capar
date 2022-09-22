import 'package:capar/app/data/models/CardsModel/cards_model.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/values/strings.dart';
import '../../../../../generated/locales.g.dart';

class CardController extends GetxController {
  final Rx<CreditCard> card = CreditCard().obs;
  final cvcIsNeeded = false.obs;
  final typeIsNeeded = false.obs;
  final kartType = "".obs;
  final isNotValidType = false.obs;

  //cart'y save edyan yeri?

  @override
  void onInit() {
    card.update(
      (val) {
        val!.cardHolder = LocaleKeys.cardHoldr;
        val.expiredDate = 'XX/XX';
        val.number = 'XXXX XXXX XXXX XXXX';
        val.cvc = "";
      },
    );
    super.onInit();
  }

  addCardToWallet() {
    Get.find<HomeController>().addCard(card.value);
    Get.back();
  }

  bool validate() {
    if (card.value.type == enmBankKartlar.unknown && kartType.isEmpty) {
      isNotValidType(true);
      return false;
    } else {
      isNotValidType(false);
      return true;
    }
  }

  cardTypeUpdate(enmBankKartlar type) {
    card.update((val) {
      val!.image = Strings.pathToBankImage(type);
      val.name = Strings.pathToBankName(type);
      val.type = type;
      isNotValidType(false);
      // save edilende gidilyan yeri niri?
    }); //Kartlary gosya yone girip cykanson yitya. isledip gorkezay. Sonam CVC cykanok. Onynkyny prosto kopiya edip goydum
    if (type == enmBankKartlar.senagatBank ||
        type == enmBankKartlar.rysgalBank ||
        type == enmBankKartlar.milli) {
      cvcIsNeeded(true);
    } else {
      cvcIsNeeded(false);
    }
  }

  cardUpdate(
      {String? num, String? expr, String? holder, String? name, String? cvc}) {
    card.update(
      (val) {
        if (num != null) {
          String num1 = num.replaceAll(RegExp(r'(?<=.{2})\d(?=.{4})'), '*');
          val!.number = num1;
          if (num.length >= 5 && num.length <= 9) {
            var type = Strings.pathToBankCard(num)['type'];
            if (type == enmBankKartlar.unknown) {
              typeIsNeeded(true);
            } else {
              typeIsNeeded(false);
            }
            if (type == enmBankKartlar.milli ||
                type == enmBankKartlar.senagatBank) {
              cvcIsNeeded(true);
            } else {
              cvcIsNeeded(false);
            }
            val.type = type;
            val.image = Strings.pathToBankCard(num)['path'];
          }
          if (num.length == 19) {
            val.bind = num;
          }
        }
        if (expr != null) {
          val!.expiredDate = expr;
        }
        if (name != null) {
          val!.name = name;
        }
        if (holder != null) {
          val!.cardHolder = holder.toUpperCase();
        }
        if (cvc != null &&
            cvc.isNotEmpty &&
            !cvc.startsWith("-") &&
            cvc.length == 3) {
          val!.cvc = cvc;
        }
      },
    );
  }
}
