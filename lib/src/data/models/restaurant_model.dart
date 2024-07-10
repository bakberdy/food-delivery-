import '../../domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant {
  RestaurantModel(
      {required super.picture, required super.name, required super.address});

  factory RestaurantModel.fromJson(Map<String, dynamic> json){
    return RestaurantModel(
        picture: json['picture'], name: json['name'], address: json['address']);
  }
}