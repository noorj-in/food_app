import 'item_ingredients_model.dart';

class FoodItem {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final ItemIngredients calories;
  int quantity;
  int requiredQuantity;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.calories,
    required this.quantity,
    this.requiredQuantity = 0,
  });
}
