import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/authentication/pages/sign_up/payment_method.dart';
import 'package:food_ninja/src/presentation/widgets/auth_textfield.dart';
import 'package:food_ninja/src/presentation/widgets/screen_wrapper.dart';
import 'package:food_ninja/src/presentation/widgets/submit_button.dart';

class SignUpProcessPage extends StatefulWidget {
  const SignUpProcessPage({super.key});

  @override
  State<SignUpProcessPage> createState() => _SignUpProcessPageState();
}

class _SignUpProcessPageState extends State<SignUpProcessPage> {
  final _mobileNumberController =
      MaskedTextController(text: '', mask: '+0 (000) 000 00 00');

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
                  "Fill in your bio to get started",
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
                  'This data will be displayed in your account\nprofile for security',
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
              AuthTextField(
                  hintText: 'First Name', controller: TextEditingController()),
              SizedBox(
                height: 15.h,
              ),
              AuthTextField(
                  hintText: 'Last Name', controller: TextEditingController()),
              SizedBox(
                height: 15.h,
              ),
              AuthTextField(
                hintText: 'Mobile Number',
                controller: _mobileNumberController,
                keyboardType: const TextInputType.numberWithOptions(),
              ),
              SizedBox(
                height: 220.h,
              ),
              Center(
                  child: SubmitButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentMethod()));
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
