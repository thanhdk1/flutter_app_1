import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/common/resource/keylanguage_resource/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key, this.textColor}) : super(key: key);
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        KeyLanguage.nodata.tr,
        style: appStyle.textTheme.bodyText1?.apply(color: textColor),
      ),
    );
  }
}
