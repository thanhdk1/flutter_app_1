class MethodModel {
  int? methodId;
  String? image;
  String? name;
  String? type;
  MethodModel({this.methodId, this.image, this.type, this.name});
}

class MethodMock {
  static List<MethodModel> methodsBanking = [
    MethodModel(
        methodId: 1,
        name: 'VietCombank',
        image: 'assets/images/ic_vietcombank.png',
        type: 'bank'),
    MethodModel(
        methodId: 2,
        name: 'Momo',
        image: 'assets/images/ic_momo.png',
        type: 'bank'),
    MethodModel(
        methodId: 3,
        name: 'BIDV',
        image: 'assets/images/ic_bidv.png',
        type: 'bank'),
    MethodModel(
        methodId: 4,
        name: 'ViettelPay',
        image: 'assets/images/ic_viettelpay.png',
        type: 'bank'),
    MethodModel(
        methodId: 5,
        name: 'HD Bank',
        image: 'assets/images/ic_hdbank.png',
        type: 'bank'),
  ];
  static List<MethodModel> methodsQrCode = [
    MethodModel(
        methodId: 1,
        name: 'Pvoil Easy',
        image: 'assets/images/ic_qrcode.png',
        type: 'qrcode'),
    MethodModel(
        methodId: 2,
        name: 'Buy to Go',
        image: 'assets/images/ic_qrcode.png',
        type: 'qrcode'),
  ];
}
