import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvoil_station/common/extension/app_extension.dart';

import '../../../common/core/sys/base_controller.dart';
import '../../../common/core/widget/bottom_sheet/cupertino_picker_bottomsheet.dart';
import '../../../common/helper/view_utils.dart';
import '../../../common/local_storage/local_storage.dart';
import '../../../common/page_manager/route_path.dart';
import '../../../common/resource/enum_resource.dart';
import '../../../data/model/account/account_model.dart';
import '../../../data/model/userInfo/user.dart';

class ProfileController extends BaseController {
  @override
  Future<void> initialData() async {
    await fetchData();
    var user = UserInfo(
        email: 'thanhkhac14@gmail.com',
        name: 'PVOIL EASY',
        phoneNumber: 123456,
        rate: 3,
        ratings: 15);
  }

  @override
  Future<void> fetchData() async {
    setStatus(Status.success);
  }
}
