import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../common/core/sys/base_controller.dart';
import '../../../common/resource/enum_resource.dart';
import '../../../common/resource/image_resource.dart';

class ItemTypesController extends BaseController {
  List<ItemTypesData> itemTypesData = [];
  @override
  Future<void> initialData() async {
    itemTypesData = [
      ItemTypesData(
        id: 0,
        title: "Dầu DO 0,05S-II",
        icon: ImageResource.ic_account,
      ),
      ItemTypesData(
        id: 1,
        title: "Xăng E5 RON92-II",
        icon: ImageResource.ic_account,
      ),
      ItemTypesData(
        id: 2,
        title: "Xăng E5 RON95-II",
        icon: ImageResource.ic_account,
      ),
    ];
    await fetchData();
  }

  @override
  Future<void> fetchData() async {}
}

class ItemTypesData {
  int? id;
  String? title;
  String? icon;
  ItemTypesData({this.id, this.title, this.icon}) {}
}
