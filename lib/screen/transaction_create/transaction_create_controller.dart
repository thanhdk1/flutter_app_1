import 'dart:io';

import 'package:get/get.dart';
import 'package:pvoil_station/common/core/sys/base_controller.dart';
import 'package:pvoil_station/data/model/method/method.dart';

class TransactionCreateController extends BaseController {
  RxInt processIndex = 0.obs;
  RxList<MethodModel> methodsBanking = MethodMock.methodsBanking.obs;
  RxList<MethodModel> methodsQrcode = MethodMock.methodsQrCode.obs;
  @override
  Future initialData() async {
    await fetchData();
  }

  @override
  Future<void> fetchData() async {}

  void onChangeProcess() {
    if (processIndex.value == 3) {
      processIndex.value = 0;
    } else {
      processIndex.value += 1;
    }
  }
}
