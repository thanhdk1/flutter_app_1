import 'dart:math';

import 'package:pvoil_station/common/core/sys/base_controller.dart';
import 'package:pvoil_station/common/resource/enum_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  PageController? pageController;
  RxInt currentTab = 0.obs;
  DateTime now = DateTime.now();

  @override
  Future<void> initialData() async {
    pageController = PageController(initialPage: currentTab.value);
    setStatus(Status.success);
  }

  void onChangePage(int value) {
    pageController?.jumpToPage(value);
    currentTab.value = value;
  }

  @override
  Future<void> onReady() async {
    // Get.toNamed(RoutePath.SEARCH_DEVICE);
    super.onReady();
  }

  void resumedData() async {
  }
}
