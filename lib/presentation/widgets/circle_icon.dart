import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.color,
      this.padding,
      this.borderColor,
      this.onTap});
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: padding,
          alignment: Alignment.center,
          height: height ?? 36.h,
          width: width ?? 36.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? Colors.transparent,
            border: Border.all(
              color: borderColor ?? color ?? Colors.transparent,
              width: 1.0,
            ),
          ),
          child: child),
    );
  }
}
