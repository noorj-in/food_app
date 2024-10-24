import 'package:flutter/cupertino.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/services/models/food_item_model.dart';
import 'package:food_app/utils/utilities.dart';
import 'package:food_app/view_models/dashboard_view_model.dart';

class CartViewModel extends ChangeNotifier {
  bool _disposed = false;
  int cutleryCount = 1;
  double totalCost = 0;

  void calculateTotalCost() {
    if (cartItems.isNotEmpty) {
      for (var e in cartItems) {
        totalCost += e.price * e.requiredQuantity;
      }
    } else {
      totalCost = 0;
    }
    notifyListeners();
  }

  void updateCartItemQuantity(FoodItem item, int newQuantity) {
    for (var e in cartItems) {
      if (e.id == item.id) {
        if (newQuantity == 0) {
          cartItems.removeWhere((ele) => ele.id == item.id);
          totalCost = 0;
          calculateTotalCost();
          notifyListeners();
          showFloatingSnack(strings.removeItem);
        } else {
          e.requiredQuantity = newQuantity;
          break;
        }
      }
    }
    totalCost = 0;
    if (cartItems.isNotEmpty) {
      calculateTotalCost();
    }
    notifyListeners(); // Notify listeners about the changes
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
