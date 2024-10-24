import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/routing/routes.dart';
import 'package:food_app/services/models/filter_options_model.dart';
import 'package:food_app/services/models/food_item_model.dart';
import 'package:food_app/services/models/item_ingredients_model.dart';
import 'package:food_app/utils/app.dart';
import 'package:food_app/utils/custom_widgets.dart';
import 'package:food_app/utils/utilities.dart';

//Global variables
List<FoodItem> cartItems = [];

class DashboardViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool _disposed = false;
  bool isVerticalLayout = true;
  List<FoodItem> foodItems = [];
  List<FilterOptions> filtersList = [];

  void loadFoodItems() {
    foodItems = [
      FoodItem(
        id: 1,
        name: 'Two slices of pizza with delicious salami',
        description: 'Two slices of pizza with salami',
        price: 12.40,
        imageUrl: 'assets/images/ic_pizza.png',
        calories: ItemIngredients(
          kcal: '325',
          grams: '420',
          protein: '21',
          fat: '19',
          carb: '64',
        ),
        quantity: 2,
      ),
      FoodItem(
        id: 2,
        name: 'Poke with chicken',
        description:
            'Famous Hawaiian dish with tender chicken breast, mushrooms, and unagi sauce.',
        price: 47.00,
        imageUrl: 'assets/images/ic_poke_chicken.png',
        calories: ItemIngredients(
          kcal: '315',
          grams: '450',
          protein: '21',
          fat: '25',
          carb: '64',
        ),
        quantity: 4,
      ),
      FoodItem(
        id: 3,
        name: 'Salad with radishes, tomatoes, and mushrooms',
        description:
            'A fresh salad with radishes, tomatoes, and mushrooms, perfect for a light meal.',
        price: 25.00,
        imageUrl: 'assets/images/ic_salad.png',
        calories: ItemIngredients(
          kcal: '300',
          grams: '420',
          protein: '25',
          fat: '19',
          carb: '60',
        ),
        quantity: 4,
      ),
      FoodItem(
        id: 4,
        name: 'Grilled Chicken Burger',
        description:
            'Juicy grilled chicken burger served with fresh lettuce and a side of fries.',
        price: 15.00,
        imageUrl: 'assets/images/ic_chicken_burger.png',
        calories: ItemIngredients(
          kcal: '550',
          grams: '350',
          protein: '35',
          fat: '22',
          carb: '45',
        ),
        quantity: 1,
      ),
      FoodItem(
        id: 5,
        name: 'Mutton Biryani',
        description:
            'Aromatic basmati rice cooked with tender mutton and spices.',
        price: 22.50,
        imageUrl: 'assets/images/ic_mutton_biryani.png',
        calories: ItemIngredients(
          kcal: '640',
          grams: '500',
          protein: '40',
          fat: '30',
          carb: '70',
        ),
        quantity: 3,
      ),
      FoodItem(
        id: 6,
        name: 'Vegan Buddha Bowl',
        description:
            'A wholesome bowl with quinoa, avocado, chickpeas, and roasted vegetables.',
        price: 18.00,
        imageUrl: 'assets/images/ic_buddha_bowl.png',
        calories: ItemIngredients(
          kcal: '380',
          grams: '400',
          protein: '15',
          fat: '18',
          carb: '50',
        ),
        quantity: 2,
      ),
      FoodItem(
        id: 7,
        name: 'Spaghetti Carbonara',
        description:
            'Classic Italian pasta with creamy carbonara sauce, pancetta, and parmesan.',
        price: 20.00,
        imageUrl: 'assets/images/ic_spaghetti_carbonara.png',
        calories: ItemIngredients(
          kcal: '700',
          grams: '350',
          protein: '25',
          fat: '30',
          carb: '80',
        ),
        quantity: 2,
      ),
      FoodItem(
        id: 8,
        name: 'BBQ Chicken Wings',
        description:
            'Succulent chicken wings glazed in BBQ sauce, served with ranch dip.',
        price: 16.00,
        imageUrl: 'assets/images/ic_bbq_chicken_wings.png',
        calories: ItemIngredients(
          kcal: '540',
          grams: '300',
          protein: '35',
          fat: '25',
          carb: '30',
        ),
        quantity: 3,
      ),
      FoodItem(
        id: 9,
        name: 'Pancakes with Maple Syrup',
        description:
            'Fluffy pancakes topped with maple syrup and fresh berries.',
        price: 10.00,
        imageUrl: 'assets/images/ic_pancakes.png',
        calories: ItemIngredients(
          kcal: '450',
          grams: '350',
          protein: '8',
          fat: '15',
          carb: '80',
        ),
        quantity: 2,
      ),
      FoodItem(
        id: 10,
        name: 'Caesar Salad',
        description:
            'Classic Caesar salad with romaine lettuce, croutons, parmesan, and Caesar dressing.',
        price: 12.00,
        imageUrl: 'assets/images/ic_caesar_salad.png',
        calories: ItemIngredients(
          kcal: '320',
          grams: '300',
          protein: '12',
          fat: '20',
          carb: '25',
        ),
        quantity: 2,
      ),
    ];
    filtersList = [
      FilterOptions(
        name: 'Salads',
        isSelected: false,
      ),
      FilterOptions(
        name: 'Pizzas',
        isSelected: false,
      ),
      FilterOptions(
        name: 'Beverages',
        isSelected: false,
      ),
      FilterOptions(
        name: 'Snacks',
        isSelected: false,
      ),
    ];
    notifyListeners();
  }

  void selectFilters(FilterOptions filterOption) {
    for (var e in filtersList) {
      if (e.name == filterOption.name) {
        e.isSelected = true;
      } else {
        e.isSelected = false;
      }
    }
    notifyListeners();
  }

  void changeLayout() {
    isVerticalLayout = !isVerticalLayout;
    notifyListeners();
  }

  Future<void> addItemToCart(FoodItem item, int itemQuantity) async {
    cartItems.add(item);
    for (var e in cartItems) {
      if (e.id == item.id) {
        e.requiredQuantity = itemQuantity;
      }
    }
    cartItems = cartItems.toSet().toList();
    app.pop();
    showFloatingSnack(strings.itemAddedToCart);
    await Future.delayed(Duration(milliseconds: 1000)).then((val) {
      app.push(Routes.cart);
    });
    notifyListeners();
  }

  showProductDetails(FoodItem item) {
    int itemCount = 1;
    showModalBottomSheet(
      context: app.ctx!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              constraints: BoxConstraints(maxHeight: 700.h, minHeight: 500.h),
              decoration: cardShadow(),
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 16.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: cardShadow(
                          borderRadius: 100.r,
                          color: customColors.lightGreyLoginSuccess
                              .withOpacity(0.001),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            item.imageUrl,
                            width: 190.w,
                            height: 190.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    app.columnSpacer(),
                    Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    app.columnSpacer(height: 6.h),
                    Text(
                      item.description,
                      style: TextStyle(
                        color: customColors.textGreyColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    app.columnSpacer(),
                    Container(
                      width: app.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: customColors.lightGrey.withOpacity(0.4),
                          width: 2.w,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildDetails(key: item.calories.kcal, value: 'kcal'),
                          buildDetails(
                              key: item.calories.grams, value: 'grams'),
                          buildDetails(
                              key: item.calories.protein, value: 'proteins'),
                          buildDetails(key: item.calories.fat, value: 'fats'),
                          buildDetails(key: item.calories.carb, value: 'carbs'),
                        ],
                      ),
                    ),
                    app.columnSpacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          strings.addInPoke,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          decoration: BoxDecoration(
                            color: customColors.lightGrey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (itemCount != 1) {
                                      itemCount--;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_rounded,
                                  color: customColors.black,
                                  size: 15.sp,
                                ),
                              ),
                              app.rowSpacer(width: 2.w),
                              Text(
                                '$itemCount',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              app.rowSpacer(width: 2.w),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (itemCount <= item.quantity) {
                                      itemCount++;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: customColors.black,
                                  size: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: elevatedButton(
                            message:
                                '${strings.addToCart} \n \$${double.tryParse((item.price * itemCount).toString())?.toStringAsFixed(2)}',
                            isBold: true,
                            isFullWidth: false,
                            textColor: customColors.white,
                            backgroundColor: customColors.black,
                            showGradient: false,
                            callBack: () async {
                              addItemToCart(item, itemCount);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildDetails({
    required String key,
    required String value,
    bool isBold = true,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          key,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        app.columnSpacer(height: 2.h),
        Text(
          value,
          style: TextStyle(
            color: customColors.textGreyColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}




