import 'package:pvoil_station/common/core/app_core.dart';
import 'package:pvoil_station/common/resource/app_resource.dart';
import 'package:flutter/material.dart';

class CupertinoSwitchComp extends StatelessWidget {
  final bool? value;
  final Function(bool value)? onChanged;
  final Color? activeColor;
  final Color? thumbColor;
  final Color? trackColor;
  final double scale;

  const CupertinoSwitchComp({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.thumbColor,
    this.trackColor,
    this.scale = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellComp(
      onTap: () => onChanged?.call(false),
      borderRadiusAll: 100,
      paddingAll: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: value!
                ? activeColor ?? ColorResource.primary
                : ColorResource.greyC7C7),
        width: 44,
        height: 23,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: !value! ? 0 : 20,
              right: !value! ? 20 : 0,
              child:  Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
