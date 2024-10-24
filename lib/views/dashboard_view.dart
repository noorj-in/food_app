import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/utils/app.dart';
import 'package:food_app/utils/widgets/carousel.dart';
import 'package:food_app/utils/widgets/filter_button.dart';
import 'package:food_app/utils/widgets/products_list.dart';
import 'package:food_app/view_models/dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      onViewModelReady: (m) => m.loadFoodItems(),
      viewModelBuilder: () => DashboardViewModel(),
      builder: (_, model, __) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: customColors.black,
              ),
            ),
            title: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: customColors.black,
                borderRadius: BorderRadius.circular(15.0.r),
              ),
              child: Text(
                '100a Ealing Rd . 24 mins',
                style: TextStyle(
                  color: customColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.saved_search_outlined,
                  color: customColors.black,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    strings.hitsOfTheWeek,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Carousel(
                  imagesList: model.foodItems.take(4).toList(),
                  padding: EdgeInsets.zero,
                  onTap: (index) {},
                ),
                app.columnSpacer(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      model.filtersList.length,
                      (index) {
                        return FilterButton(
                          index: index,
                          filterOption: model.filtersList[index].name,
                          showBorder: model.filtersList[index].isSelected,
                          onTap: () {
                            model.selectFilters(model.filtersList[index]);
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 1.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        strings.productsView,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          model.changeLayout();
                        },
                        icon: Icon(
                          model.isVerticalLayout
                              ? Icons.view_list
                              : Icons.view_module,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                if (model.isVerticalLayout) ...[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.foodItems.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return VerticalProducts(
                        foodItem: model.foodItems[index],
                        index: index,
                        onTap: () {
                          model.showProductDetails(model.foodItems[index]);
                        },
                      );
                    },
                  ),
                ] else ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        model.foodItems.length,
                        (index) {
                          return HorizontalProducts(
                            foodItem: model.foodItems[index],
                            index: index,
                            onTap: () {
                              model.showProductDetails(model.foodItems[index]);
                            },
                          );
                        },
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
