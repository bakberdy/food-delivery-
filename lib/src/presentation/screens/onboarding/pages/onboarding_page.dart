import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/authentication/widgets/authentication.dart';

import '../../../widgets/submit_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentItemIndex = 0;

  List<Map<String, String>> onboardItems = [
    {
      "image": "assets/images/onboard_1.png",
      "shadow_image": "assets/images/onboard_1_shadow.png",
      "title_part_1": "Find your Comfort",
      "title_part_2": "Food here",
      "description":
          "Here You Can find a chef or dish for every taste and color. Enjoy!"
    },
    {
      "image": "assets/images/onboard_2.png",
      "shadow_image": "assets/images/onboard_2_shadow.png",
      "title_part_1": "Food Ninja is Where Your",
      "title_part_2": " Comfort Food Lives",
      "description": "Enjoy a fast and smooth food delivery at your doorstep"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 435.h,
                  child: Image.asset(
                      color: themeData.shadowColor,
                      fit: BoxFit.cover,
                      onboardItems[_currentItemIndex]['shadow_image'] ?? "")),
              Positioned(
                top: 70.h,
                left: 0,
                right: 0,
                child: SizedBox(
                    width: double.infinity,
                    height: 300.h,
                    child: Image.asset(
                        fit: BoxFit.contain,
                        onboardItems[_currentItemIndex]['image'] ?? '')),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                onboardItems[_currentItemIndex]['title_part_1'] ?? "",
                style: TextStyle(
                    color: themeData.primaryColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                onboardItems[_currentItemIndex]['title_part_2'] ?? "",
                style: TextStyle(
                    color: themeData.primaryColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            children: [
              SizedBox(
                width: 245.w,
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: themeData.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                    onboardItems[_currentItemIndex]['description'] ?? ""),
              )
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          SubmitButton(
            onTap: () {
              if(_currentItemIndex>0){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Authentication()), (val)=>false);
              }
              else{
              setState(() {
                _currentItemIndex++;
              });}
            },
            label: 'Next',
          )
        ],
      ),
    );
  }
}
