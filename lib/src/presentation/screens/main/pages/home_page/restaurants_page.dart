import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/data/models/restaurant_model.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage(
      {super.key, required this.title, required this.restaurants});

  final String title;
  final List<RestaurantModel> restaurants;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1.5,
                    child: Image.asset(
                        fit: BoxFit.cover,
                        "assets/images/home_bg_pattern.png"))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PreferredSize(
                        preferredSize: Size.fromHeight(0.h),
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h,bottom: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 45.h,
                                      width: 45.w,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(15.r)),
                                    ),
                                    Image.asset(
                                      color: Colors.orange,
                                      'assets/icons/icon_back.png',
                                      width: 45.w,
                                      height: 45.h,
                                    ),
                                  ],
                                )),
                          ),
                        )),
                    searchBar(themeData, false, () {}),
                    SizedBox(
                      height: 20.h,
                    ),
                    showTitle(themeData, title),
                    SizedBox(
                      height: 20.h,
                    ),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: restaurants.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0.w,
                          crossAxisSpacing: 20.0.h,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          final RestaurantModel restaurant = restaurants[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8.sp),
                              height: 200.h,
                              width: 140.w,
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
                          );
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text showTitle(ThemeData themeData, String title) {
    return Text(
      title,
      style: TextStyle(
          color: themeData.primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700),
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
