import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

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
import 'account_controller.dart';

class ProfileMediumLayout extends GetView<ProfileController> {
  final _profileMediumLayout = Get.lazyPut(() => ProfileController());
  ProfileMediumLayout({Key? key}) : super(key: key);
  BuildContext? context;
  var user = UserInfo(
      email: 'thanhkhac14@gmail.com',
      name: 'PVOIL EASY',
      phoneNumber: 123456,
      rate: 3,
      ratings: 15);
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    user.name ?? '',
                    style: appStyle.textTheme.bodyText1
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  ImageViewer(
                    ImageResource.ic_phone,
                    width: 10,
                    height: 12,
                  ),
                  Text(
                    " ${KeyLanguage.phone.tr} : ${user.phoneNumber.toString()}",
                    maxLines: 1,
                    style: appStyle.textTheme.bodyText1
                        ?.apply(color: Colors.white.withOpacity(.6)),
                  ),
                ],
              ),
              Row(
                children: [
                  ImageViewer(
                    ImageResource.ic_email,
                    width: 10,
                    height: 12,
                  ),
                  Text(
                    " ${KeyLanguage.email.tr} : ${user.email ?? ''}",
                    maxLines: 1,
                    style: appStyle.textTheme.bodyText1
                        ?.apply(color: Colors.white.withOpacity(.6)),
                  ),
                ],
              ),
              Row(
                children: [
                  ImageViewer(
                    ImageResource.ic_like_2,
                    width: 10,
                    height: 12,
                  ),
                  Text(
                    " ${KeyLanguage.ratings.tr} : ${user.ratings.toString()}",
                    maxLines: 1,
                    style: appStyle.textTheme.bodyText1
                        ?.apply(color: Colors.white.withOpacity(.6)),
                  ),
                ],
              ),
              Row(
                children: [
                  ImageViewer(
                    ImageResource.ic_heart,
                    width: 10,
                    height: 12,
                  ),
                  Text(
                    " ${KeyLanguage.rate.tr} : ",
                    maxLines: 1,
                    style: appStyle.textTheme.bodyText1
                        ?.apply(color: Colors.white.withOpacity(.6)),
                  ),
                  StarRating(
                    rate: user.rate ?? 0,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  getContext() => this.context;
}

class StarRating extends StatelessWidget {
  final int rate;
  final double size;
  final Color color;

  StarRating({
    required this.rate,
    this.size = 15,
    this.color = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        rate,
        (index) => Icon(
          Icons.star,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
