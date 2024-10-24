import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/utils/app.dart';

/// Returns an elevated button with the specified color, message
/// [backgroundColor] renders the color on button, default color is black
/// [message] text to be display on button
/// [callBack] fires an event on user taps on button
Widget elevatedButton({
  required String message,
  required VoidCallback? callBack,
  String? payment,
  bool isFullWidth = true,
  Color? backgroundColor,
  bool showGradient = true,
  bool showPayment = false,
  IconData? icon,
  Color? iconColor,
  Color? textColor,
  bool isBold = false,
  EdgeInsets? edgeInsets,
  double? fontSize,
  double? borderRadius,
  bool showElevation = false,
  bool showQR = false,
}) {
  return Container(
    width: isFullWidth ? app.width : null,
    decoration: showGradient
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(12.0.r),
          )
        : null,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: showGradient
            ? Colors.transparent
            : backgroundColor ?? customColors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        padding: EdgeInsets.zero,
        elevation: showElevation ? 2 : 0,
      ),
      onPressed: callBack,
      child: Padding(
        padding: edgeInsets ??
            EdgeInsets.symmetric(
              vertical: showPayment ? 12.h : 10.h,
              horizontal: 30.h,
            ),
        child: showPayment
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: fontSize ?? 16.sp,
                        fontWeight: isBold ? FontWeight.bold : null,
                      ),
                    ),
                  ),
                  Text(
                    payment ?? '',
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 16.sp,
                      fontWeight: isBold ? FontWeight.bold : null,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showQR)
                    const Icon(
                      Icons.qr_code,
                      color: Colors.white,
                    ),
                  SizedBox(
                    width: showQR ? 8.w : 0,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 16.sp,
                      fontWeight: isBold ? FontWeight.bold : null,
                    ),
                  ),
                ],
              ),
      ),
    ),
  );
}

/// Returns an text button with the specified color, message
/// [color] renders the color on button, default color is black
/// [message] text to be display on button
/// [callBack] fires an event on user taps on button
Widget textButton(
    {required String message,
    VoidCallback? callBack,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration}) {
  return TextButton(
    onPressed: callBack,
    child: Text(
      message,
      style: TextStyle(
        color: color ?? customColors.blue,
        fontSize: fontSize ?? 13.sp,
        decoration: textDecoration,
        fontFamily: 'SFProDisplay',
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    ),
  );
}

Widget buildItemDetails({
  required String key,
  required String value,
}) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: customColors.lightGrey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Text(
          '\$$key ',
          style: TextStyle(
            color: customColors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      app.rowSpacer(width: 10.w),
      Text(
        value,
        style: TextStyle(
          color: customColors.lightGrey,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget buildVerticalItemDetails({
  required String key,
  required String value,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: customColors.lightGrey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Text(
          '\$$key ',
          style: TextStyle(
            color: customColors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      app.columnSpacer(height: 6.w),
      Text(
        value,
        style: TextStyle(
          color: customColors.lightGrey,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
