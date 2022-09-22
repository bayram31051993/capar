// import 'package:capar/core/utils/enums.dart';

// class Payments {
//   String status = "";
//   List<Payment> list = [];
//   List<Payment> listReserw = [];

//   // List<Payment> get getListSorted {
//   //   List<Payment> newlist = list;
//   //   list.sort((a, b) => b.date.compareTo(a.date));
//   //   return newlist;
//   // }

//   Payments({required this.status, required this.list});

//   sortByType(enmPaymentType type) {
//     list = list.where((element) => element.paymentType == type).toList();
//   }

//   sortUp() {
//     list.sort((a, b) => b.date.compareTo(a.date));
//   }

//   sortDown() {
//     list.sort((a, b) => a.date.compareTo(b.date));
//   }

//   unSort() {
//     list = listReserw;
//   }

//   Payments.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['list'] != null) {
//       list = <Payment>[];
//       json['list'].forEach((v) {
//         list.add(Payment.fromJson(v));
//         listReserw.add(Payment.fromJson(v));
//       });
//       sortUp();
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['status'] = status;
//     data['list'] = list.map((v) => v.toJson()).toList();
//     return data;
//   }
// }

// class Payment {
//   String getReasonDisplay = "";
//   String getKindDisplay = "";
//   String getStatusDisplay = "";
//   double amount = 0.0;
//   DateTime date = DateTime.now();
//   String paidNumber = "";
//   enmPaymentType paymentType = enmPaymentType.tmcell;

//   Payment(
//       {required this.getReasonDisplay,
//       required this.getKindDisplay,
//       required this.getStatusDisplay,
//       required this.amount,
//       required this.date,
//       required this.paidNumber});

//   Payment.fromJson(Map<String, dynamic> json) {
//     getReasonDisplay = json['rs'] ?? "";
//     getKindDisplay = json['ki'] ?? "";
//     getStatusDisplay = json['st'] ?? "";
//     amount = json['am'] ?? 0.0;
//     date = DateTime.tryParse(json['dt']) ?? DateTime.now();
//     paidNumber = json['pn'] ?? "";
//     switch (json['rs']) {
//       case 'Kurýeri cagyrmak üçin':
//         break;
//       case 'Zakaz üçin':
//         break;
//       case 'PÝGG jerime':
//         paymentType = enmPaymentType.pygg;
//         break;
//       // case 'Telekom':
//       //   paymentType = enmPaymentType.tmTelekom;
//       //   break;
//       // case 'TMCELL':
//       //   paymentType = enmPaymentType.tmCell;
//       //   break;
//       // case 'GTS Telefon':
//       //   paymentType = enmPaymentType.agtsTelefon;
//       //   break;
//       // case 'GTS IPTV':
//       //   paymentType = enmPaymentType.agtsIpTv;
//       //   break;
//       // case 'GTS Internet':
//         // paymentType = enmPaymentType.agtsInternet;
//         // break;
//       // case 'Suw':
//       //   paymentType = enmPaymentType.water;
//       //   break;
//       // case 'Elektrik energiyasy':
//       //   paymentType = enmPaymentType.electro;
//       //   break;
//       // case 'Jemagat tolegi':
//       //   paymentType = enmPaymentType.utils;
//       //   break;
//       // case 'Telecom TV':
//       //   paymentType = enmPaymentType.cabelTV;
//       //   break;
//       default:
//     }
//     if (paymentType.name.startsWith("agts")) {
//       amount -= 0.20;
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['rs'] = getReasonDisplay;
//     data['ki'] = getKindDisplay;
//     data['st'] = getStatusDisplay;
//     data['am'] = amount;
//     data['dt'] = date;
//     data['pn'] = paidNumber;
//     return data;
//   }
// }
