import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/screen/news_page/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends GetWidget<NewsController> {
  NewsPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => NewsController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComp(height: 0, isLight: false),
      backgroundColor: Colors.transparent,
      body: const Center(
        child: Text("PAGE4",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}
