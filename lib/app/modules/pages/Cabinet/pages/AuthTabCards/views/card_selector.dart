import 'package:capar/app/data/models/CardsModel/cards_model.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/core/values/strings.dart';
import 'package:capar/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSelector extends GetView<HomeController> {
  const CardSelector({Key? key, required this.card, required this.isForChoose})
      : super(key: key);
  final CreditCard card;
  final bool isForChoose;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) {},
      confirmDismiss: (direction) {
        return Get.defaultDialog<bool>(
          title: LocaleKeys.attention.tr,
          content: Text(LocaleKeys.delWarr.tr, textAlign: TextAlign.center),
          onCancel: () => Get.back<bool>(result: false),
          onConfirm: () {
            controller.deletCard(card);
            Get.back<bool>(result: true);
          },
        );
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ListTile(
          onTap: isForChoose ? () => Get.back(result: card) : () {},
          leading: Image.asset(Strings.pathToBankCard(card.bind)['path']),
          title: Text(
            card.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(card.cardHolder),
          trailing: Text(card.expiredDate),
        ),
      ),
    );
  }
}
