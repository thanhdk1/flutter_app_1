class SignUpModelRequest {
  String? phoneNumber;
  String? password;
  String? email;

  SignUpModelRequest({this.phoneNumber, this.password, this.email});

  SignUpModelRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}
