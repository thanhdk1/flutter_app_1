// ignore_for_file: invalid_use_of_protected_member

import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/common/helper/utils.dart';
import 'package:pvoil_station/common/resource/color_resource.dart';
import 'package:pvoil_station/common/resource/keylanguage_resource/key_language.dart';
import 'package:pvoil_station/data/model/method/method.dart';
import 'package:pvoil_station/screen/transaction_create/transaction_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class OrderPage extends GetWidget<TransactionCreateController> {
  void Function() onNext;
  OrderPage({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => Visibility(
              visible: Utils.isNotNullAndEmpty(controller.methodsBanking.value),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titlePaymentBanking,
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 100 *
                            (controller.methodsBanking.value.length / 4)
                                .ceil()
                                .toDouble(),
                        child: GridView.count(
                          crossAxisCount: 4,
                          primary: false,
                          padding: const EdgeInsets.all(0),
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          children: controller.methodsBanking.value
                              .map((e) => _itemBuilder(e, 40))
                              .toList(),
                        ),
                      ),
                      titlePaymentQrCode,
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 180 *
                            (controller.methodsQrcode.value.length / 2)
                                .ceil()
                                .toDouble(),
                        child: Center(
                          child: GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.all(0),
                            children: controller.methodsQrcode.value
                                .map((e) => _itemBuilder(e, 100))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButtonComp(
                            widthValue: 200,
                            title: Row(
                              children: [
                                const SizedBox(width: 20),
                                const Icon(CupertinoIcons.arrow_right),
                                const SizedBox(width: 8),
                                Text(
                                  KeyLanguage.next_step.tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            radius: const BorderRadius.all(Radius.circular(15)),
                            onPressed: onNext,
                          )
                        ],
                      ),
                    ]),
              ),
            )));
  }

  Widget get titlePaymentBanking =>
      Text(KeyLanguage.payment_banking.tr, style: appStyle.textTheme.headline5);

  Widget get titlePaymentQrCode =>
      Text(KeyLanguage.payment_qrcode.tr, style: appStyle.textTheme.headline5);

  Widget _itemBuilder(MethodModel method, double size) {
    return Column(
      children: [
        Card(
          color: ColorResource.textBody,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            // color: Colors.white,
            child: ImageViewer(
              method.image ?? '',
              width: size,
              height: size,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          method.name ?? 'unknown',
          style: appStyle.textTheme.bodyText1
              ?.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
