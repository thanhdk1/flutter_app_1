import 'package:pvoil_station/screen/home/home_controller.dart';
import 'package:pvoil_station/screen/transaction_create/transaction_create_page.dart';
import 'package:pvoil_station/screen/transaction_process/transaction_process_page.dart';
import 'package:pvoil_station/screen/transaction_list/transaction_list_page.dart';
import 'package:pvoil_station/screen/news_page/news_page.dart';
import 'package:pvoil_station/screen/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PanelBodyComp extends GetView<HomeController> {
  const PanelBodyComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: _buildItem,
      itemCount: 5,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        return TransactionCreatePage();
      case 1:
        return TransactionProcessPage();
      case 2:
        return TransactionListPage();
      case 3:
        return NewsPage();
      case 4:
        return SettingsPage();
    }
    return SettingsPage();
  }
}
