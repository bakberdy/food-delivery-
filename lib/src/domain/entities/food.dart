abstract class Food {
  final String foodName;
  final String foodPrice;
  final String  foodCategory;
  final double  foodRating;
  final String  foodImage;

  Food(
      {required this.foodName,
      required this.foodPrice,
      required this.foodCategory,
      required this.foodRating,
      required this.foodImage});
}