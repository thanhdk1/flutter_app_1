// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/common/helper/app_common.dart';
import 'package:pvoil_station/screen/transaction_create/components/method_page.dart';
import 'package:pvoil_station/screen/transaction_create/components/process_timeline.dart';
import 'package:pvoil_station/screen/transaction_create/transaction_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionCreatePage extends GetWidget<TransactionCreateController> {
  TransactionCreatePage({Key? key}) : super(key: key) {
    Get.lazyPut(() => TransactionCreateController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComp(
            title: KeyLanguage.create_transaction.tr, isLeading: false),
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Obx(() =>
              ProcessTimeline(processIndex: controller.processIndex.value)),
          BuilderLayout(
            processIndex: controller.processIndex.value,
            controller: controller,
            width: MediaQuery.of(context).size.width,
          ),
        ]));
  }
}

class BuilderLayout extends StatefulWidget {
  late int processIndex;
  late TransactionCreateController controller;
  late double width;
  BuilderLayout(
      {super.key,
      required this.processIndex,
      required this.controller,
      required this.width});
  @override
  _BuilderLayoutState createState() => _BuilderLayoutState();
}

class _BuilderLayoutState extends State<BuilderLayout> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(widget.processIndex);
    });
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * widget.width,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onChangeIndex(int index) {
    _scrollToIndex(index);
    widget.controller.onChangeProcess();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: [
              SizedBox(
                width: widget.width,
                height: double.infinity,
                child: MethodPage(onNext: () => onChangeIndex(1)),
              ),
              SizedBox(
                width: widget.width,
                height: double.infinity,
                // color: Colors.green,
                child: ElevatedButton(
                  onPressed: () => onChangeIndex(2),
                  child: const Text('Scroll to Item 2'),
                ),
              ),
              SizedBox(
                  width: widget.width,
                  height: double.infinity,
                  // color: Colors.blue,
                  child: ElevatedButton(
                    onPressed: () => onChangeIndex(3),
                    child: const Text('Scroll to Item 0'),
                  )),
              SizedBox(
                  width: widget.width,
                  height: double.infinity,
                  // color: Colors.blue,
                  child: ElevatedButton(
                    onPressed: () => onChangeIndex(0),
                    child: const Text('Scroll to Item 0'),
                  )),
            ],
          );
        },
      ),
    ));
  }
}
