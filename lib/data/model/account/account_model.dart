class AccountLocal {
  String? phoneNumber;
  String? password;
  String? token;
  int? ownerId;
  int? exp;
  AccountLocal.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    password = json['password'];
    ownerId = json['ownerId'];
    exp = json['exp'];
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['token'] = token;
    data['ownerId'] = ownerId;
    data['exp'] = exp;
    return data;
  }

  AccountLocal(
      {this.phoneNumber, this.password, this.token, this.ownerId, this.exp});
}
