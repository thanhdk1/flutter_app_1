import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pvoil_station/screen/settings/item_types/item_types_controller.dart';

import '../../../common/core/theme/theme_manager.dart';
import '../../../common/core/widget/avatar/avatar_pick_comp.dart';
import '../../../common/core/widget/button/elevated_button_comp.dart';
import '../../../common/core/widget/image/image_viewer.dart';
import '../../../common/core/widget/image/svg_comp.dart';
import '../../../common/core/widget/layout/ink_well_comp.dart';
import '../../../common/helper/view_utils.dart';
import '../../../common/resource/image_resource.dart';
import '../../../common/resource/keylanguage_resource/key_language.dart';
import '../../../data/model/userInfo/user.dart';
import 'item_types_controller.dart';

class ItemTypesLayout extends GetView<ItemTypesController> {
  final _profileMediumLayout = Get.lazyPut(() => ItemTypesController());
  ItemTypesLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: controller.itemTypesData.length,
      scrollDirection: Axis.vertical,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    ItemTypesData itemData = controller.itemTypesData[index];
    return Container(
      child: Text("hehe"),
    );
  }
}
