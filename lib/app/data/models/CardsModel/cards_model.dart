import 'package:capar/core/utils/enums.dart';
import 'package:capar/core/utils/log.dart';

List<CreditCard> fromCardList(Map<String, dynamic> json) {
  var cards = <CreditCard>[];
  json['cards'].forEach((v) {
    cards.add(CreditCard.fromJson(v));
  });
  return cards;
}

class CreditCard {
  String id = '';
  String name = '';
  String number = '';
  String bind = '';
  String cardHolder = '';
  String expiredDate = '';
  String image = "";
  String cvc = "";
  enmBankKartlar type = enmBankKartlar.unknown;

  CreditCard(
      {this.id = '',
      this.name = '',
      this.number = '',
      this.bind = '',
      this.cardHolder = '',
      this.expiredDate = '',
      this.image = "",
      this.cvc = ""});

  CreditCard.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    number = json['number'] ?? "";
    bind = json['bind'] ?? "";
    cardHolder = json['cardHolder'] ?? "";
    expiredDate = json['expiredDate'] ?? "";
    cvc = cvcUniversal(json['cvc']);
    image = json['image'] ?? "";
    if (json['type'] != null || json['type'] != "") {
      type = enmBankKartlar.values.byName(json['type']);
    } else {
      type = enmBankKartlar.unknown;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    data['bind'] = bind;
    data['cardHolder'] = cardHolder;
    data['expiredDate'] = expiredDate;
    data['cvc'] = cvc;
    data['image'] = image;
    data['type'] = type.name;
    return data;
  }

  String cvcUniversal(dynamic data) {
    if (data == null) return "";
    try {
      var rez = '';
      if (data.runtimeType is int) {
        rez = data.toString();
      } else {
        rez = data.toString();
      }
      return rez;
    } catch (e) {
      Logger.print("cvcUniversal " + e.toString());
    }
    return "";
  }

  Map<String, dynamic> getCardPayParams(String orderId) {
    return {
      "MDORDER": orderId,
      "\$EXPIRY": "20${expiredDate.substring(3)}${expiredDate.substring(0, 2)}",
      "\$PAN": bind.replaceAll(' ', ''),
      "MM": expiredDate.substring(0, 2),
      "YYYY": expiredDate.substring(3),
      "TEXT": cardHolder.trim(),
      "\$CVC": cvc.toString(),
      "language": "ru",
      "bindingNotNeeded": "true",
      "jsonP.arams": "{}",
    };
  }
}
