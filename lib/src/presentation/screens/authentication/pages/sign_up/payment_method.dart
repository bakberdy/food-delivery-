import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/authentication/pages/sign_up/upload_preview.dart';
import '../../../../widgets/screen_wrapper.dart';
import '../../../../widgets/submit_button.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
                  "Payment Method",
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
              SizedBox(
                  height: 80.h,
                  width: double.infinity,
                  child: _ImageButton(
                    isSelected: true,
                      src: 'assets/images/visa_logo.png', onPressed: () {})),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                  height: 80.h,
                  width: double.infinity,
                  child: _ImageButton(
                      src: 'assets/images/paypal_logo.png', onPressed: () {})),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                  height: 80.h,
                  width: double.infinity,
                  child: _ImageButton(
                      src: 'assets/images/payoneer_logo.png',
                      onPressed: () {})),
              SizedBox(
                height: 200.h,
              ),
              Center(child: SubmitButton(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const UploadPreview()));
              }, label: 'Next')),
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
      required this.src,
      required this.onPressed,
      this.isSelected = false});

  final String src;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
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
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: Image.asset(
        color: isSelected ? Colors.green : Theme.of(context).primaryColor,
        src,
        fit: BoxFit.contain,
      ),
    );
  }
}
