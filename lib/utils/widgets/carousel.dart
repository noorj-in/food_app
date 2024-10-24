import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/services/models/food_item_model.dart';
import 'package:food_app/utils/app.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
    required this.imagesList,
    required this.onTap,
    this.padding,
    this.boxFit,
  });

  final List<FoodItem> imagesList;
  final Function(int index) onTap;
  final EdgeInsets? padding;
  final BoxFit? boxFit;

  @override
  State<Carousel> createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  int _current = 0;
  List<List<Color>> gradientColors = [];

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  void updatePage(int page) {
    _carouselController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() {
      _current = page;
    });
  }

  void generateGradientColors() {
    gradientColors = List.generate(5, (index) {
      return customColors
          .predefinedGradients[index % customColors.predefinedGradients.length];
    });
  }

  @override
  void initState() {
    generateGradientColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.imagesList.isEmpty
            ? Padding(
                padding:
                    widget.padding ?? EdgeInsets.symmetric(horizontal: 16.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0.r),
                  child: Image.asset(
                    'assets/images/ic_veggie_burger.png',
                    width: app.width,
                    fit: widget.boxFit ?? BoxFit.fill,
                  ),
                ),
              )
            : CarouselSlider(
                items: widget.imagesList.map((e) {
                  return GestureDetector(
                    onTap: () {
                      widget.onTap(widget.imagesList.indexOf(e));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30.h, top: 35.h),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0.r),
                        gradient: LinearGradient(
                          colors: gradientColors[widget.imagesList.indexOf(e)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: Offset(0, -15),
                            child: ClipOval(
                              child: Image.asset(
                                e.imageUrl,
                                height: 108.h,
                                width: 116.w,
                                fit: widget.boxFit ?? BoxFit.fill,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  e.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'SFProDisplay',
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: customColors.black,
                                    borderRadius: BorderRadius.circular(15.0.r),
                                  ),
                                  child: Text(
                                    '\$${e.price}',
                                    style: TextStyle(
                                      color: customColors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'SFProDisplay',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
                carouselController: _carouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  animateToClosest: false,
                  aspectRatio: 1.25,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
        if (widget.imagesList.length > 1) app.columnSpacer(height: 5.h),
        if (widget.imagesList.length > 1)
          Positioned(
            bottom: 0.0.h,
            left: 0.0.w,
            right: 0.0.w,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: widget.imagesList.asMap().entries.map((entry) {
                return Container(
                  width: 60.0.w,
                  height: 4.0.h,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0.h,
                    horizontal: 6.0.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0.r),
                    shape: BoxShape.rectangle,
                    color: _current == entry.key
                        ? customColors.black
                        : Colors.grey.shade300,
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
