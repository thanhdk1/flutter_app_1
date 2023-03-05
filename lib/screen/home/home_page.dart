import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/screen/home/components/pannel_body_comp.dart';
import 'package:pvoil_station/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> with WidgetsBindingObserver {
  HomePage({Key? key}) : super(key: key);
  final _homecontroller = Get.lazyPut(() => HomeController());
  @override
  Widget build(BuildContext context) {
    return MainLayout<HomeController>(
      resizeToAvoidBottomInset: false,
      appBar: AppBarComp(
        height: 0,
        isLight: true,
      ),
      child: Stack(children: [
        // const Positioned.fill(
        //     child: ImageViewer(
        //   ImageResource.img_bg_main,
        //   fit: BoxFit.cover,
        // )),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: const PanelBodyComp(),
          extendBody: true,
          bottomNavigationBar: Obx(() => BottomAppBarComp(
              onChangeTab: controller.onChangePage,
              tabIndex: controller.currentTab.value)),
        )
      ]),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) controller.resumedData();
  }
}
