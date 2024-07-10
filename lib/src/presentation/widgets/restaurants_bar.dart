
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/restaurant_model.dart';

class RestaurantsBar extends StatelessWidget {
  const RestaurantsBar({
    super.key,
    required this.isLoading,
    required this.restaurants,
    required this.themeData,
    required this.title,
    required this.onViewAll,
  });

  final bool isLoading;
  final List<RestaurantModel> restaurants;
  final ThemeData themeData;
  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Nearest Restaurant",
              style: TextStyle(
                color: themeData.primaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: onViewAll,
              child: Text(
                "View More",
                style: TextStyle(
                  color: const Color(0xffFF8E4C),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        isLoading
            ? CircularProgressIndicator(
                color: themeData.cardColor,
              )
            : SizedBox(
                height: 180.h,
                child: ListView.builder(
                    itemCount: restaurants.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final RestaurantModel restaurant = restaurants[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Container(
                            padding: EdgeInsets.all(8.sp),
                            height: 180.h,
                            width: 145.w,
                            decoration: BoxDecoration(
                              color: themeData.canvasColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Image.network(
                                  restaurant.picture,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  maxLines: 1,
                                  restaurant.name,
                                  style: TextStyle(
                                    color: themeData.primaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  restaurant.address,
                                  style: TextStyle(
                                    color: const Color(0xffFEAD1D)
                                        .withOpacity(0.3),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
      ],
    );
  }
}
