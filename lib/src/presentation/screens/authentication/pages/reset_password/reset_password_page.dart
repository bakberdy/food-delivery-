import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/authentication/pages/reset_password/verification_reset_password.dart';

import '../../../../widgets/screen_wrapper.dart';
import '../../../../widgets/submit_button.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
                  "Forgot password?",
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
                  'Select which contact details should we\nuse to reset your password',
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
                  child: _ImageButton(
                    isSelected: true,
                    onPressed: () {},
                    leading: 'assets/icons/Message.png',
                    title: 'Via sms: ',
                    subtitle:'+7 (###) ### ## ##',
                  )),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                  height: 85.h,
                  width: double.infinity,
                  child: _ImageButton(
                    onPressed: () {},
                    title: 'Via email: ',
                    subtitle: '#####@##.##',
                    leading: 'assets/icons/Email.png',
                  )),
              SizedBox(
                height: 200.h,
              ),
              Center(
                  child: SubmitButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerificationResetPassword()));
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

class _ImageButton extends StatelessWidget {
  const _ImageButton(
      {super.key,
      required this.leading,
      required this.onPressed,
      this.isSelected = false,
      required this.title,
      required this.subtitle});

  final String leading;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
          border: isSelected ? Border.all(width: 2, color: Colors.green) : null,
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          children: [
            SizedBox(width: 20.w,),
            Image.asset(leading),
            SizedBox(width: 15.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(
                  color: Color(0xff828282),
                  fontSize:16.sp,
fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 5.h,),
                Text(subtitle, style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize:14.sp,
fontWeight: FontWeight.w400
                ),),
              ],
            )
          ],
        ));
  }
}
