class GetUserSmsCodeModel {
  GetUserSmsCodeModel({
    required this.detail,
  });
  late final Detail detail;
  
  GetUserSmsCodeModel.fromJson(Map<String, dynamic> json){
    detail = Detail.fromJson(json['detail']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['detail'] = detail.toJson();
    return _data;
  }
}

class Detail {
  Detail({
    required this.msg,
    required this.loc,
    required this.type,
  });
  late final String msg;
  late final List<Loc> loc;
  late final String type;
  
  Detail.fromJson(Map<String, dynamic> json){
    msg = json['msg'];
    loc = List.from(json['loc']).map((e)=>Loc.fromJson(e)).toList();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['loc'] = loc.map((e)=>e.toJson()).toList();
    _data['type'] = type;
    return _data;
  }
}

class Loc {
  Loc({
    required this.smsId,
  });
  late final int smsId;
  
  Loc.fromJson(Map<String, dynamic> json){
    smsId = json['sms_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sms_id'] = smsId;
    return _data;
  }
}