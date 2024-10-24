import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantitySelector({
    super.key,
    this.initialQuantity = 0,
    required this.onQuantityChanged,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
    widget.onQuantityChanged(_quantity);
  }

  void _decreaseQuantity() {
    if (_quantity >= 1) {
      setState(() {
        _quantity--;
      });
      widget.onQuantityChanged(_quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: _decreaseQuantity,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: customColors.lightGrey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '$_quantity',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        InkWell(
          onTap: _increaseQuantity,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: customColors.lightGrey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
