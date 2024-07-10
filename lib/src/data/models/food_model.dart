import 'package:food_ninja/src/domain/entities/food.dart';

class FoodModel extends Food {
  FoodModel(
      {required super.foodName, required super.foodPrice, required super.foodCategory, required super.foodRating, required super.foodImage});

   factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
        foodName: json['food_name'],
        foodPrice : json['food_price'],
        foodCategory : json['food_category'],
        foodRating : json['food_rating'],
        foodImage : json['food_image']);
  }
}