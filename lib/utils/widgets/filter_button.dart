import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.index,
    required this.filterOption,
    required this.showBorder,
    required this.onTap,
  });

  final int index;
  final String filterOption;
  final bool showBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? 12.w : 0.w,
          right: 8.w,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: customColors.lightGrey.withOpacity(0.4),
          border: showBorder
              ? Border.all(
                  color: customColors.skyBlue,
                  width: 2.w,
                )
              : null,
        ),
        child: index == 0
            ? Icon(
                Icons.tune_outlined,
                size: 22.sp,
              )
            : Text(
                filterOption,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
      ),
    );
  }
}
