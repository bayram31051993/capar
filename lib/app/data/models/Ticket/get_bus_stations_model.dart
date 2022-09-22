class GetBusStationsModel {
  Detail? detail;

  GetBusStationsModel({this.detail});

  GetBusStationsModel.fromJson(Map<String, dynamic> json) {
    detail =
        json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
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
        loc!.add(new Loc.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.loc != null) {
      data['loc'] = this.loc!.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    return data;
  }
}

class Loc {
  int? id;
  String? name;

  Loc({this.id, this.name});

  Loc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
