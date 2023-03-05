import 'dart:io';

import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/common/extension/app_extension.dart';
import 'package:pvoil_station/common/helper/app_common.dart';
import 'package:pvoil_station/common/resource/app_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog extends StatelessWidget {
  final String title, content;

  const PermissionDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AlertDialog(
            title: Text(title.toUpperCaseLetter),
            content: Text(content),
            actions: [
              TextButtonComp(
                title: KeyLanguage.cancel,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButtonComp(
                title: KeyLanguage.setting.toUpperCaseLetter,
                style: appStyle.textTheme.headline4!
                    .apply(color: ColorResource.primary),
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                // ignore: prefer_const_constructors
                child: Text(KeyLanguage.cancel),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                // ignore: prefer_const_constructors
                child: Text(KeyLanguage.setting),
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
              ),
            ],
          );
  }
}
