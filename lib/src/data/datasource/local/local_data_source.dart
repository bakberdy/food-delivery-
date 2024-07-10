import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_ninja/src/data/models/food_model.dart';
import '../../models/restaurant_model.dart';

class LocalDataSource {
  Future<List<RestaurantModel>> restaurants() async {
    try {
      final jsonString = await rootBundle.loadString("lib/src/data/datasource/restaurants.json");
      final List jsonList = jsonDecode(jsonString);
      return jsonList.map((val) => RestaurantModel.fromJson(val)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<FoodModel>> foods() async {
    try {
      final jsonString = await rootBundle.loadString("lib/src/data/datasource/foods.json");
      final List jsonList = jsonDecode(jsonString);
      return jsonList.map((val) => FoodModel.fromJson(val)).toList();
    } catch (e) {
      return [];
    }
  }
}
