class CabinetModel {
  Detail? detail;

  CabinetModel({this.detail});

  CabinetModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  String? uid;
  String? mob;
  String? frn;
  String? lsn;
  String? add;
  String? fon;
  String? crn;
  int? cid;
  String? wid;
  String? gid;
  String? eid;

  Loc(
      {this.uid,
      this.mob,
      this.frn,
      this.lsn,
      this.add,
      this.fon,
      this.crn,
      this.cid,
      this.wid,
      this.gid,
      this.eid});

  Loc.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? "";
    mob = json['mob'] ?? "";
    frn = json['frn'] ?? "";
    lsn = json['lsn'] ?? "";
    add = json['add'] ?? "";
    fon = json['fon'] ?? "";
    crn = json['crn'] ?? "";
    cid = json['cid'] ?? 0;
    wid = json['wid'] ?? "";
    gid = json['gid'] ?? "";
    eid = json['eid'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['mob'] = mob;
    data['frn'] = frn;
    data['lsn'] = lsn;
    data['add'] = add;
    data['fon'] = fon;
    data['crn'] = crn;
    data['cid'] = cid;
    data['wid'] = wid;
    data['gid'] = gid;
    data['eid'] = eid;
    return data;
  }
}
