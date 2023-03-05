import 'package:flutter/material.dart';

class InkWellComp extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? splashColor;
  final Color? highlightColor;
  final bool? isTransparent;
  final double? titleSize;
  final FontWeight? titleFontWeight;
  final EdgeInsetsGeometry? padding;
  final double? paddingAll;

  // BorderRadius.circular(10)
  final double? borderRadiusAll;
  final BorderRadius? borderRadius;
  final TextStyle? style;

  final bool? isDotted;
  final Decoration? decorationDotted;

/*  DottedDecoration(
  shape: Shape.box,
  dash: <int>[1, 4],
  borderRadius: BorderRadius.circular(10),
  );*/
  final Border? border;

  const InkWellComp({
    Key? key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.titleColor,
    this.padding,
    this.borderRadiusAll,
    this.style,
    this.paddingAll,
    this.border,
    this.titleFontWeight,
    this.titleSize,
    this.isDotted = false,
    this.decorationDotted,
    this.splashColor,
    this.highlightColor,
    this.isTransparent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      shape: border,
      borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusAll ?? 0),
      child: InkWell(
        splashColor: isTransparent! ? Colors.transparent : splashColor,
        highlightColor: isTransparent! ? Colors.transparent : highlightColor,
        onTap: () {
          Future.delayed(const Duration(milliseconds: 70), () {
            onTap?.call();
          });
        },
        borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusAll ?? 8),
        child: Container(padding: padding ?? EdgeInsets.all(paddingAll ?? 8), child: child),
      ),
    );
  }
}
