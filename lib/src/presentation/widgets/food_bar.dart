import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/food_model.dart';

class FoodBar extends StatelessWidget {
  const FoodBar({
    super.key,
    required this.foods,
    required this.themeData,
    required this.title,
    this.maxFoods = 1000,
    required this.onViewAll,
  });

  final VoidCallback onViewAll;
  final String title;
  final List<FoodModel> foods;
  final ThemeData themeData;
  final int maxFoods;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " $title",
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
        ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: maxFoods > foods.length ? foods.length : 3,
            //foods.length,
            itemBuilder: (context, index) {
              final FoodModel food = foods[index];
              return Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                margin: EdgeInsets.only(bottom: 15.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: themeData.canvasColor),
                width: double.infinity,
                height: 87.h,
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  visualDensity: const VisualDensity(
                    vertical: 4.0,
                  ),
                  horizontalTitleGap: 20.w,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      height: 65.h,
                      width: 65.w,
                      food.foodImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.foodName,
                        style: TextStyle(
                            color: themeData.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      ),
                      Text(
                        food.foodCategory,
                        style: TextStyle(
                            color: themeData.primaryColor.withOpacity(0.4),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                  trailing: Text(
                    "\$${food.foodPrice}",
                    style: TextStyle(
                        color: const Color(0xffFEAD1D),
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp),
                  ),
                ),
              );
            })
      ],
    );
  }
}
