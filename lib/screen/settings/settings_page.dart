import 'package:expandable/expandable.dart';
import 'package:pvoil_station/common/core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pvoil_station/common/helper/app_common.dart';
import 'package:pvoil_station/screen/settings/profile/account_controller.dart';
import 'package:pvoil_station/screen/settings/profile/account_comp.dart';
import 'package:pvoil_station/screen/settings/settings_controller.dart';
import '../../common/core/widget/filter_access/comp/item_collapse.dart';
import '../../data/model/userInfo/user.dart';
import '../../../common/resource/image_resource.dart';
import 'item_types/item_types_layout.dart';

class SettingsPage extends GetWidget<SettingsController> {
  SettingsPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => SettingsController());
  }
  var user = UserInfo(
      email: 'thanhkhac14@gmail.com',
      name: 'PVOIL EASY',
      phoneNumber: 123456,
      rate: 3,
      ratings: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComp(
          isLight: false, title: KeyLanguage.setting.tr, isLeading: false),
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PickAvatarComp(
                url: ImageResource.avt_0,
                iconSize: const Size(25, 25),
                name: user.name,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: controller.settingsHeader.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    SettingsHeaderData headerData = controller.settingsHeader[index];
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.5, color: Colors.white.withOpacity(.5)))),
            child: ExpandablePanel(
              controller: headerData.expandableController,
              collapsed: InkWellComp(
                onTap: () =>
                    headerData.onExpandedClick(controller.settingsHeader),
                paddingAll: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ImageViewer(
                        headerData.icon ?? ImageResource.ic_check_circular,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        headerData.title ?? "",
                        style: appStyle.textTheme.bodyText1?.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Expanded(child: SizedBox()),
                      const ImageViewer(ImageResource.ic_arrow_down,
                          width: 16, height: 16),
                      const SizedBox(width: 10, height: 10),
                    ],
                  ),
                ),
              ),
              expanded: Column(
                children: [
                  ExpandableButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              ImageViewer(
                                headerData.icon ??
                                    ImageResource.ic_check_circular,
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                headerData.title ?? "",
                                style: appStyle.textTheme.bodyText1?.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Expanded(child: SizedBox()),
                              const ImageViewer(ImageResource.ic_arrow_up,
                                  width: 16, height: 16),
                              const SizedBox(width: 10, height: 10),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  ViewDescription(index + 1),
                ],
              ),
              theme: const ExpandableThemeData(
                hasIcon: false,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ViewDescription(int index) {
    switch (index) {
      case 1:
        return ProfileMediumLayout();
      case 2:
        return SizedBox();
      case 3:
        return Text("Địt mọa ");
      default:
        return SizedBox();
    }
  }
}
