// // To parse this JSON data, do
// //
// //     final ticketPassengersModel = ticketPassengersModelFromJson(jsonString);

// import 'dart:convert';

// // TicketPassengersModel ticketPassengersModelFromJson(String str) =>
// //     TicketPassengersModel.fromJson(json.decode(str));

// // String ticketPassengersModelToJson(TicketPassengersModel data) =>
// //     json.encode(data.toJson());

// class TicketPassengersModel {
//   TicketPassengersModel({
//     this.id,
//     this.firstName,
//     this.lstName,
//     this.docNum,
//     this.gender,
//     this.bDate,
//   });

//   int? id;
//   String? firstName;
//   String? lstName;
//   String? docNum;
//   String? gender;
//   String? bDate;

//   factory TicketPassengersModel.fromMap(Map<String, dynamic> json) =>
//       TicketPassengersModel(
//         id: json["id"],
//         firstName: json["firstName"],
//         lstName: json["lstName"],
//         docNum: json["docNum"],
//         gender: json["gender"],
//         bDate: json["bDate"],
//       );

//   Map<String, Object?> toMap() {
//     return {
//       'id': id,
//       'firstName': firstName,
//       'lstName': lstName,
//       'docNum': docNum,
//       'gender': gender,
//       'bDate': bDate
//     };
//   }
// }

List<TicketPassengersModel> fromCardList(Map<String, dynamic> json) {
  var cards = <TicketPassengersModel>[];
  json['cards'].forEach((v) {
    cards.add(TicketPassengersModel.fromJson(v));
  });
  return cards;
}

class TicketPassengersModel {
  String id = '';
  String firstName = '';
  String lstName = '';
  String docNum = '';
  String gender = '';
  String bDate = '';

  TicketPassengersModel({
    this.id = '',
    this.firstName = '',
    this.lstName = '',
    this.docNum = '',
    this.gender = '',
    this.bDate = '',
  });

  factory TicketPassengersModel.fromJson(Map<String, dynamic> json) =>
      TicketPassengersModel(
        id: json["id"],
        firstName: json["firstName"],
        lstName: json["lstName"],
        docNum: json["docNum"],
        gender: json["gender"],
        bDate: json["bDate"],
      );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lstName': lstName,
      'docNum': docNum,
      'gender': gender,
      'bDate': bDate
    };
  }
}
