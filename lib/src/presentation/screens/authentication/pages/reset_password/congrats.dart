import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/widgets/screen_wrapper.dart';

import '../../../../widgets/submit_button.dart';

class CongratsResetPassword extends StatelessWidget {
  const CongratsResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ScreenWrapper(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 240.h),
            Image.asset('assets/icons/congrats.png'),
             Text(
                  'Congrats!',
                  style: TextStyle(
                      height: 1.8,
                      color: themeData.cardColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.sp),
                ),
            Text(
                  'Password reset successful',
                  style: TextStyle(
                      height: 1.8,
                      color: themeData.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 23.sp),
                ),
            SizedBox(height: 160.h),
            Center(child: SubmitButton(onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              }, label: 'Back', ))
          ],
        ));
  }
}
