import 'package:expandable/expandable.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/common/core/sys/base_controller.dart';
import 'package:pvoil_station/common/resource/image_resource.dart';
import 'package:pvoil_station/screen/settings/profile/account_comp.dart';
import 'package:flutter/material.dart';
import '../../common/page_manager/route_path.dart';

class SettingsController extends BaseController {
  List<SettingsHeaderData> settingsHeader = [];
  ProfileMediumLayout profileMediumLayout = ProfileMediumLayout();
  get expandableController => null;

  @override
  Future initialData() async {
    settingsHeader = [
      SettingsHeaderData(
          id: 0,
          title: "Thông tin người dùng",
          icon: ImageResource.ic_account,
          expandableController: ExpandableController()..toggle()),
      SettingsHeaderData(
          id: 1,
          title: "Thiết lập bán nhanh",
          icon: ImageResource.ic_play,
          expandableController: ExpandableController()..toggle()),
      SettingsHeaderData(
          id: 2,
          title: "Thiết lập mặt hàng",
          icon: ImageResource.ic_locker,
          expandableController: ExpandableController()..toggle()),
    ];
    await fetchData();
  }

  void openPage(int index) {
    switch (index) {
      case 0:
        Get.toNamed(RoutePath.USER_MODE_DETAIL);
        break;
    }
  }

  @override
  Future<void> fetchData() async {}
}

class SettingsHeaderData {
  int? id;
  String? title;
  String? icon;
  ExpandableController? expandableController;
  Function? layout;
  RxBool? isExpanded;
  SettingsHeaderData(
      {this.id,
      this.title,
      this.expandableController,
      this.icon,
      this.layout}) {
    (expandableController ??= ExpandableController()).addListener(() {
      isExpanded?.value = expandableController?.expanded ?? false;
    });
    isExpanded = expandableController?.expanded.obs;
  }
  void onExpandedClick(List<SettingsHeaderData> mHeader) {
    mHeader
        .where((element) => element.expandableController?.expanded ?? false)
        .forEach((element) {
      element.expandableController?.expanded = false;
    });
    expandableController?.toggle();
  }
}
