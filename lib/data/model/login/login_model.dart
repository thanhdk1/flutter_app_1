class LoginModelRequest {
  String? phoneNumber;
  String? password;

  LoginModelRequest({this.phoneNumber, this.password});

  LoginModelRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}

class OtpModelRequest {
  String? phoneNumber;
  String? otp;

  OtpModelRequest({this.phoneNumber, this.otp});

  OtpModelRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['otp'] = otp;
    return data;
  }
}

class LoginModelResponse {
  String? sub;
  int? nbf;
  String? kid;
  int? ownerId;
  int? exp;
  String? token;

  LoginModelResponse(
      {this.sub, this.nbf, this.kid, this.ownerId, this.exp, this.token});

  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> jsonExact = {};
    if (json.containsKey('keys') && json['keys'].length > 0) {
      // jsonExact = json[json['keys'][0]]['tokens'];
      if (json.containsKey('account_token') &&
          json['account_token'][json['keys'][0]].length > 0) {
        jsonExact = json['tokens'][json['account_token'][json['keys'][0]][0]];
      } else {
        jsonExact = json['tokens'][json['keys'][0]];
      }
    }
    sub = jsonExact['sub'];
    nbf = jsonExact['nbf'];
    kid = jsonExact['kid'];
    ownerId = jsonExact['ownerId'];
    exp = jsonExact['exp'];
    token = jsonExact['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub'] = sub;
    data['nbf'] = nbf;
    data['kid'] = kid;
    data['ownerId'] = ownerId;
    data['exp'] = exp;
    data['token'] = token;
    return data;
  }
}
