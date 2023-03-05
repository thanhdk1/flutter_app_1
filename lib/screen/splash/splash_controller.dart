import 'dart:io';

import 'package:get/get.dart';
import 'package:pvoil_station/common/core/sys/base_controller.dart';
import 'package:pvoil_station/common/network/client.dart';
import 'package:pvoil_station/common/page_manager/route_path.dart';

class SplashController extends BaseController {
  @override
  Future initialData() async {
    await fetchData();
  }

  @override
  Future<void> fetchData() async {
    Client().setBaseUrl('https://apis.safegate.vn');
    Client().setHeader({
      HttpHeaders.userAgentHeader: 'SafeGate Application Android/9.0 IOS/9.0',
      'Host': 'apis.safegate.vn',
      //  'Accept': '*/*'
    });
    await delay(3000);
    Get.offAllNamed(RoutePath.LOGIN);
  }
}
