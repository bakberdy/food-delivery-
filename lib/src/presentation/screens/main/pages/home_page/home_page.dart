import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:food_ninja/src/data/datasource/local/local_data_source.dart';
import 'package:food_ninja/src/data/models/food_model.dart';
import 'package:food_ninja/src/data/models/restaurant_model.dart';
import 'package:food_ninja/src/presentation/screens/main/pages/home_page/restaurants_page.dart';

import '../../../../widgets/food_bar.dart';
import '../../../../widgets/restaurants_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RestaurantModel> restaurants = [];
  List<FoodModel> foods = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
    print('init');
  }

  Future<void> _loadData() async {
    try {
      List<RestaurantModel> loadedRestaurants =
          await LocalDataSource().restaurants();
      List<FoodModel> loadedFoods = await LocalDataSource().foods();
      setState(() {
        foods = loadedFoods;
        restaurants = loadedRestaurants;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            showTitleAndnotificationButton(themeData),
            SizedBox(
              height: 20.h,
            ),
            searchBar(themeData, false, () {}),
            SizedBox(
              height: 20.h,
            ),
            showAddBanner(themeData),
            SizedBox(
              height: 20.h,
            ),
            RestaurantsBar(
              isLoading: isLoading,
              restaurants: restaurants,
              themeData: themeData,
              title: 'Nearest Restaurant',
              onViewAll: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RestaurantsPage(title: 'Nearest Restaurant', restaurants: restaurants,)));
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            FoodBar(
              foods: foods,
              themeData: themeData,
              title: 'Popular Menu',
              maxFoods: 3,
              onViewAll: () {

              },
            ),
            SizedBox(
              height: 120.h,
            )
          ],
        ),
      ),
    );
  }

  Stack showAddBanner(ThemeData themeData) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            width: double.infinity,
            "assets/images/daily_add.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 40.w,
          bottom: 20.h,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)))),
              onPressed: () {},
              child: Text(
                'Buy Now',
                style: TextStyle(color: themeData.cardColor),
              )),
        )
      ],
    );
  }

  Row showTitleAndnotificationButton(ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Find Your\nFavorite Food",
          style: TextStyle(
              color: themeData.primaryColor,
              fontSize: 32.sp,
              height: 1.3,
              fontWeight: FontWeight.w700),
        ),
        Container(
          margin: EdgeInsets.all(15.sp),
          height: 45.h,
          width: 45.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: themeData.canvasColor.withOpacity(0.7),
          ),
          child: badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colors.red,
                elevation: 0,
              ),
              showBadge: true,
              position: badges.BadgePosition.topEnd(top: 7.h, end: 9.w),
              child: Center(
                  child: Image.asset(
                      height: 20, width: 20, "assets/icons/notification.png"))),
        )
      ],
    );
  }

  Row searchBar(ThemeData themeData, bool isPressedFilter,
      VoidCallback onTapFilterButton) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.h,
          width: isPressedFilter ? 325.w : 265.w,
          child: TextField(
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                fillColor: themeData.canvasColor,
                filled: true,
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: themeData.primaryColor.withOpacity(0.5)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 12.sp, right: 5.w),
                  child: Icon(
                    size: 32.sp,
                    Icons.search,
                    color: themeData.primaryColor,
                  ),
                ),
                hintText: 'What do you want to order?'),
          ),
        ),
        isPressedFilter
            ? const SizedBox()
            : const Expanded(
                child: SizedBox(),
              ),
        isPressedFilter
            ? const SizedBox()
            : InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0.r)),
                onTap: onTapFilterButton,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: themeData.canvasColor),
                    height: 50.h,
                    width: 50.w,
                    child: Image.asset(
                      height: 25,
                      width: 25,
                      "assets/icons/Filter.png",
                      fit: BoxFit.fitHeight,
                    )),
              )
      ],
    );
  }
}
