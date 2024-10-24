import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/services/models/food_item_model.dart';
import 'package:food_app/utils/app.dart';
import 'package:food_app/utils/custom_widgets.dart';
import 'package:food_app/utils/utilities.dart';

class VerticalProducts extends StatelessWidget {
  const VerticalProducts({
    super.key,
    required this.foodItem,
    required this.index,
    required this.onTap,
  });

  final FoodItem foodItem;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        margin: EdgeInsets.only(
          top: index == 0 ? 12.h : 0.h,
          bottom: 2.h,
        ),
        decoration: cardShadow(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              decoration: cardShadow(
                borderRadius: 50.r,
                color: customColors.lightGreyLoginSuccess.withOpacity(0.001),
              ),
              child: ClipOval(
                child: Image.asset(
                  foodItem.imageUrl,
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            app.rowSpacer(width: 10.w),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SFProDisplay',
                    ),
                  ),
                  app.columnSpacer(height: 6.h),
                  buildItemDetails(
                    key: double.tryParse(foodItem.price.toString())
                            ?.toStringAsFixed(2) ??
                        '',
                    value: '${foodItem.calories.kcal} Kcal',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalProducts extends StatelessWidget {
  const HorizontalProducts({
    super.key,
    required this.foodItem,
    required this.index,
    required this.onTap,
  });

  final FoodItem foodItem;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 180.w,
        height: 253.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        margin: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          left: index == 0 ? 12.h : 0.h,
          right: 20.h,
        ),
        decoration: cardShadow(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              decoration: cardShadow(
                borderRadius: 50.r,
                color: customColors.lightGreyLoginSuccess.withOpacity(0.001),
              ),
              child: ClipOval(
                child: Image.asset(
                  foodItem.imageUrl,
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            app.columnSpacer(height: 10.w),
            Text(
              foodItem.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'SFProDisplay',
              ),
            ),
            app.columnSpacer(height: 6.h),
            buildVerticalItemDetails(
              key: double.tryParse(foodItem.price.toString())
                      ?.toStringAsFixed(2) ??
                  '',
              value: '${foodItem.calories.kcal} Kcal',
            )
          ],
        ),
      ),
    );
  }
}
