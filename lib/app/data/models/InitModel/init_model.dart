import 'package:capar/core/values/strings.dart';

class InitModel {
  Detail? detail;

  InitModel({this.detail});

  InitModel.fromJson(Map<String, dynamic> json) {
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
  double? pw;
  double? pg;
  double? pe;
  int? pc;
  int? ph;
  int? fp;
  double? fi;
  double? fc;
  String ver = '3.0.0';
  double? ib;
  double? ipb;
  double? pb;
  double? tb;
  String? ut;
  String? cb;
  String? sup;
  double? mb;
  int? fns;
  String? msg;
  int? mid;

  Loc(
      {this.pw,
      this.pg,
      this.pe,
      this.pc,
      this.ph,
      this.fp,
      this.fi,
      this.fc,
      required this.ver,
      this.ib,
      this.ipb,
      this.pb,
      this.tb,
      this.ut,
      this.cb,
      this.sup,
      this.mb,
      this.fns,
      this.msg,
      this.mid});

  Loc.fromJson(Map<String, dynamic> json) {
    pw = Strings.checkDouble(json['pw']);
    pg = Strings.checkDouble(json['pg']);
    pe = Strings.checkDouble(json['pe']);
    pc = json['pc'] ?? 0;
    ph = json['ph'] ?? 0;
    fp = json['fp'] ?? 0;
    fi = Strings.checkDouble(json['fi']);
    fc = Strings.checkDouble(json['fc']);
    ver = json['ver'] ?? '';
    ib = Strings.checkDouble(json['ib']);
    ipb = Strings.checkDouble(json['ipb']);
    pb = Strings.checkDouble(json['pb']);
    tb = Strings.checkDouble(json['tb']);
    ut = json['ut'] ?? '';
    cb = json['cb'] ?? '';
    sup = json['sup'] ?? '';
    mb = Strings.checkDouble(json['mb']);
    fns = json['fns'] ?? 0;
    msg = json['msg'] ?? '';
    mid = json['mid'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pw'] = this.pw;
    data['pg'] = this.pg;
    data['pe'] = this.pe;
    data['pc'] = this.pc;
    data['ph'] = this.ph;
    data['fp'] = this.fp;
    data['fi'] = this.fi;
    data['fc'] = this.fc;
    data['ver'] = this.ver;
    data['ib'] = this.ib;
    data['ipb'] = this.ipb;
    data['pb'] = this.pb;
    data['tb'] = this.tb;
    data['ut'] = this.ut;
    data['cb'] = this.cb;
    data['sup'] = this.sup;
    data['mb'] = this.mb;
    data['fns'] = this.fns;
    data['msg'] = this.msg;
    data['mid'] = this.mid;
    return data;
  }
}
