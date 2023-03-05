import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/common/helper/app_common.dart';
import 'package:pvoil_station/common/resource/app_resource.dart';
import 'package:pvoil_station/screen/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController> {
  SplashPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComp(height: 0, isLight: false),
      backgroundColor: Colors.white,
      body: Center(
        child: ImageViewer(
          ImageResource.ic_launcher,
          width: ViewUtils.width / 2,
        ),
      ),
    );
  }
}
