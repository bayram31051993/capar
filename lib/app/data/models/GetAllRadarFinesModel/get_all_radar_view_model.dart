import 'package:capar/app/data/models/CabinetMOdel/cabinet_model.dart';
import 'package:capar/core/values/strings.dart';

class GetAllPygg {
  Detail? detail;

  GetAllPygg({this.detail});

  GetAllPygg.fromJson(Map<String, dynamic> json) {
    detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    return data;
  }
}

class Detail {
  String? msg;
  List<Loc>? loc;
  String? type;

  Detail({this.msg, this.loc, this.type});

  Detail.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['loc'] != null) {
      loc = <Loc>[];
      json['loc'].forEach((v) {
        loc!.add(Loc.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (loc != null) {
      data['loc'] = loc!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class Loc {
  List<Car>? car;

  Loc({this.car});

  Loc.fromJson(Map<String, dynamic> json) {
    if (json['car'] != null) {
      car = <Car>[];
      json['car'].forEach((v) {
        car!.add(Car.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (car != null) {
      data['car'] = car!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  sortUp() {
    car!.sort((a, b) => a.karardate!.compareTo(b.karardate.toString()));
  }

  sortDown() {
    car!.sort((a, b) => b.karardate!.compareTo(a.karardate.toString()));
  }

  List<Car> searchText(String letters) {
    return car!.where((element) => element.karar!.startsWith(letters)).toList();
  }

  List<Car> get unpaid {
    return car!.where((element) => element.status == 0).toList();
  }

  List<Car> get paid {
    return car!.where((element) => element.status == 12).toList();
  }
}

class Car {
  String? karar;
  String? karardate;
  String? gowsyrylan;
  String? bahasy;
  int? status;
  int? id;
  String? afaa;
  String? fine;
  int? informed;

  Car(
      {this.karar,
      this.karardate,
      this.gowsyrylan,
      this.bahasy,
      this.status,
      this.id,
      this.afaa,
      this.fine,
      this.informed});

  Car.fromJson(Map<String, dynamic> json) {
    karar = json['karar'];
    karardate = json['karardate'];
    gowsyrylan = json['gowsyrylan'];
    bahasy = json['bahasy'];
    status = json['status'];
    id = json['id'];
    afaa = json['afaa'];
    fine = json['fine'];
    informed = json['informed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['karar'] = karar;
    data['karardate'] = karardate;
    data['gowsyrylan'] = gowsyrylan;
    data['bahasy'] = bahasy;
    data['status'] = status;
    data['id'] = id;
    data['afaa'] = afaa;
    data['fine'] = fine;
    data['informed'] = informed;
    return data;
  }

  Map<String, dynamic> parametrs(CabinetModel cabinet) {
    Map<String, dynamic> params;
    params = {
      "full_name":
          "${cabinet.detail!.loc![0].frn} ${cabinet.detail!.loc![0].lsn}",
      "name": cabinet.detail!.loc![0].frn,
      "surname": cabinet.detail!.loc![0].lsn,
      "fine_number": karar,
      "car_number": cabinet.detail!.loc![0].crn,
      "fine_delivered_date": karardate.toString().split(" ").first,
      "fine_amount": fine,
      "afaa": afaa,
      "phone": Strings.formatHomePhoneFromeRaw(
          cabinet.detail!.loc![0].mob.toString()),
    };
    return params;
  }
}
