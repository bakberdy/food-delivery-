import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/authentication/pages/reset_password/set_new_password.dart';

import '../../../../widgets/screen_wrapper.dart';
import '../../../../widgets/submit_button.dart';

class VerificationResetPassword extends StatefulWidget {
  const VerificationResetPassword({super.key});

  @override
  State<VerificationResetPassword> createState() =>
      _VerificationResetPasswordState();
}

class _VerificationResetPasswordState extends State<VerificationResetPassword> {
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
                  "Enter 4-digit\nVerification code",
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
                  'Code send to +6282045**** . This code\nwill expired in 01:30',
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
              SizedBox(
                height: 85.h,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(2, 2),
                      ),
                    ],
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: OtpTextField(
                    styles: [
                      TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w700 ),
                       TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w700 ),
                       TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w700 ),
                       TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w700 ),
                    ],
                    keyboardType: TextInputType.number,
                    focusedBorderColor: themeData.cardColor,
                    borderColor: themeData.primaryColor,
                    fieldHeight: 200.h,
                    fieldWidth: 60.w,
                    numberOfFields: 4,
                    showFieldAsBox: false,
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                ),
              ),
              SizedBox(
                height: 340.h,
              ),
              Center(
                  child: SubmitButton(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const SetNewPassword()));
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
