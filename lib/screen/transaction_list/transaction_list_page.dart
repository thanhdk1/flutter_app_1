import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/screen/transaction_list/transaction_list_controller.dart';
import 'package:pvoil_station/screen/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionListPage extends GetWidget<TransactionListController> {
  TransactionListPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => TransactionListController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComp(height: 0, isLight: false),
      backgroundColor: Colors.transparent,
      body: const Center(
        child: Text("PAGE3",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}
