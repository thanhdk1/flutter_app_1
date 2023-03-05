import 'package:pvoil_station/common/core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pvoil_station/screen/transaction_process/transaction_process_controller.dart';

class TransactionProcessPage extends GetWidget<TransactionProcessController> {
  TransactionProcessPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => TransactionProcessController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComp(height: 0, isLight: false),
      backgroundColor: Colors.transparent,
      body: const Center(
        child: Text("PAGE1",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}
