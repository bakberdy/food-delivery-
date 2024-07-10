import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/widgets/auth_textfield.dart';

import '../../../../widgets/screen_wrapper.dart';
import '../../../../widgets/submit_button.dart';
import 'congrats.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() =>
      _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  PreferredSizeWidget appBarWithBackButton({required onTap}) {
    return PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 15.w),
          child: Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
                onTap: onTap,
                child: Stack(
                  children: [
                    Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(15.r)),
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
        ));
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ScreenWrapper(
        appbar: appBarWithBackButton(onTap: () {
          Navigator.pop(context);
        }),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Reset your password\nhere",
                  style: TextStyle(
                      height: 1.4,
                      color: themeData.primaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 27.sp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select which contact details should\nwe use to reset your password',
                  style: TextStyle(
                      height: 1.8,
                      color: themeData.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              AuthTextField(hintText: "New Password", controller: TextEditingController(), obscureText: true,),
              SizedBox(height: 15.h,),
              AuthTextField(hintText: "Confirm Password", controller: TextEditingController(), obscureText: true,),
              SizedBox(
                height: 300.h,
              ),
              Center(
                  child: SubmitButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CongratsResetPassword()));
                      },
                      label: 'Next')),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ));
  }
}
