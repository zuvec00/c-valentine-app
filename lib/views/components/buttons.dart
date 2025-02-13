import 'package:c_valentine_app/constants/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Button extends StatelessWidget {
  final String text;

  final bool border;
  final Color? color;
  final Color? borderColor;
  final double? paddingWidth;
  final double? paddingTop;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function()? onTap;

  const Button({
    super.key,
    required this.border,
    required this.text,
    required this.onTap,
    this.color,
    this.borderColor,
    this.paddingWidth,
    this.paddingTop,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: paddingWidth ?? 16.w, vertical: paddingTop ?? 12.h),
        decoration: BoxDecoration(
            color:
                border ? Colors.transparent : color ?? Utilities.primaryColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: border ? Utilities.primaryColor : Utilities.textColor,
            width: 0.75,
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              color: border ? color ?? Utilities.primaryColor : Colors.white,
              fontWeight: fontWeight ?? FontWeight.w900,
              fontSize: fontSize ?? 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final String iconPath;
  final String buttonText;
  const ButtonIcon(
      {super.key, required this.iconPath, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8.h,
        bottom: 8.h,
        left: 24.w,
      ),
      decoration: BoxDecoration(
        color: Utilities.backgroundColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 28.h,
            color: Utilities.primaryColor,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonIconOnly extends StatelessWidget {
  final String iconPath;
  final Color? color;
  final bool border;
  final double? paddingWidth;
  final double? paddingTop;
  final Function()? onTap;

  const ButtonIconOnly({
    super.key,
    this.color,
    required this.border,
    required this.iconPath,
    this.paddingWidth,
    required this.onTap,
    this.paddingTop,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: paddingWidth ?? 16.w, vertical: paddingTop ?? 12.h),
        decoration: BoxDecoration(
            color:
                border ? Colors.transparent : color ?? Utilities.primaryColor,
            borderRadius: BorderRadius.circular(3.r),
            border: Border.all(
                color: color ?? Utilities.primaryColor, width: border ? 1 : 0)),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            height: 22.h,
            color: Utilities.primaryColor,
          ),
        ),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onTap;
  const Button2(
      {super.key, required this.text, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 13.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
            color: Utilities.backgroundColor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
