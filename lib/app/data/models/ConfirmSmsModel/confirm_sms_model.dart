class ConfirmSmsModel {
  ConfirmSmsModel({
    required this.detail,
  });
  late final Detail detail;
  
  ConfirmSmsModel.fromJson(Map<String, dynamic> json){
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
    required this.userId,
    required this.accessToken,
    required this.tokenType,
  });
  late final String userId;
  late final String accessToken;
  late final String tokenType;
  
  Loc.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    return _data;
  }
}