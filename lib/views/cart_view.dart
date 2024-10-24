import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/utils/app.dart';
import 'package:food_app/utils/custom_widgets.dart';
import 'package:food_app/utils/utilities.dart';
import 'package:food_app/utils/widgets/quantity_selector.dart';
import 'package:food_app/view_models/cart_view_model.dart';
import 'package:food_app/view_models/dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      onViewModelReady: (m) => m.calculateTotalCost(),
      viewModelBuilder: () => CartViewModel(),
      builder: (_, model, __) {
        return Scaffold(
          appBar: appBar(title: strings.cart),
          body: cartItems.isEmpty
              ? Center(
                  child: Text(
                    strings.yourCartIsEmpty,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          strings.cartSubText,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        app.columnSpacer(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                strings.deliveryAddress,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            app.rowSpacer(width: 6.w),
                            textButton(
                              message: strings.changeAddress,
                              color: customColors.textGreyColor,
                              callBack: () {},
                            ),
                          ],
                        ),
                        app.columnSpacer(height: 10.h),
                        Column(
                          children: List.generate(
                            cartItems.length,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 10.h,
                                      ),
                                      decoration: cardShadow(
                                        borderRadius: 50.r,
                                        color: customColors
                                            .lightGreyLoginSuccess
                                            .withOpacity(0.001),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          cartItems[index].imageUrl,
                                          width: 80.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    app.rowSpacer(width: 10.w),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              cartItems[index].name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          app.columnSpacer(height: 6.h),
                                          QuantitySelector(
                                            initialQuantity: cartItems[index]
                                                .requiredQuantity,
                                            onQuantityChanged: (newQuantity) {
                                              model.updateCartItemQuantity(
                                                  cartItems[index],
                                                  newQuantity);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    app.rowSpacer(width: 10.w),
                                    Text(
                                      '\$${double.tryParse(cartItems[index].price.toString())?.toStringAsFixed(2) ?? ''}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        app.columnSpacer(height: 6.h),
                        Divider(
                          height: 2.h,
                          color: customColors.lightGrey.withOpacity(0.4),
                        ),
                        app.columnSpacer(height: 4.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.restaurant),
                              const Spacer(),
                              Text(
                                strings.cutlery,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              QuantitySelector(
                                initialQuantity: model.cutleryCount,
                                onQuantityChanged: (newQuantity) {
                                },
                              ),
                            ],
                          ),
                        ),
                        app.columnSpacer(height: 4.h),
                        Divider(
                          height: 2.h,
                          color: customColors.lightGrey.withOpacity(0.4),
                        ),
                        app.columnSpacer(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  strings.delivery,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                app.columnSpacer(height: 4.h),
                                Text(
                                  '${strings.freeDelivery} \$30',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: customColors.textGreyColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              '\$0.00',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        app.columnSpacer(height: 35.h),
                        Text(
                          strings.paymentMethod,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: customColors.textGreyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        app.columnSpacer(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                              ),
                              decoration: BoxDecoration(
                                color: customColors.white,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                  color: customColors.black,
                                  width: 1.h,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.apple_outlined,
                                    size: 14.sp,
                                  ),
                                  app.rowSpacer(width: 2.w),
                                  Text(
                                    strings.pay,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            app.rowSpacer(width: 3.w),
                            Text(
                              strings.applePay,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 14.sp,
                              ),
                            )
                          ],
                        ),
                        app.columnSpacer(height: 30.h),
                        elevatedButton(
                          message: strings.pay,
                          showPayment: true,
                          payment:
                              '\$${double.tryParse((model.totalCost).toString())?.toStringAsFixed(2)}',
                          isBold: true,
                          textColor: customColors.white,
                          backgroundColor: customColors.black,
                          showGradient: false,
                          callBack: () async {},
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
