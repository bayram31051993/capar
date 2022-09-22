class LoginAccessTokenModel {
  Detail? detail;

  LoginAccessTokenModel({this.detail});

  LoginAccessTokenModel.fromJson(Map<String, dynamic> json) {
    this.detail =
        json["detail"] == null ? null : Detail.fromJson(json["detail"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) data["detail"] = this.detail?.toJson();
    return data;
  }
}

class Detail {
  String? msg;
  List<Loc>? loc;
  String? type;

  Detail({this.msg, this.loc, this.type});

  Detail.fromJson(Map<String, dynamic> json) {
    this.msg = json["msg"];
    this.loc = json["loc"] == null
        ? null
        : (json["loc"] as List).map((e) => Loc.fromJson(e)).toList();
    this.type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["msg"] = this.msg;
    if (this.loc != null)
      data["loc"] = this.loc?.map((e) => e.toJson()).toList();
    data["type"] = this.type;
    return data;
  }
}

class Loc {
  String? csrftoken;
  String? tokenType;

  Loc({this.csrftoken, this.tokenType});

  Loc.fromJson(Map<String, dynamic> json) {
    csrftoken = json["csrftoken"];
    tokenType = json["token_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["csrftoken"] = this.csrftoken;
    data["token_type"] = this.tokenType;
    return data;
  }
}
