import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/authentication/pages/sign_up/profile_ready_page.dart';
import '../../../../widgets/screen_wrapper.dart';
import '../../../../widgets/submit_button.dart';
class SetLocationPage extends StatefulWidget {
  const SetLocationPage({super.key});

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  PreferredSizeWidget appBarWithBackButton({required onTap}) => PreferredSize(
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
                  "Set Your Location ",
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
                  height: 120.h,
                  width: double.infinity,
                  child: _ImageButton(
                    onPressed: () {},
                    text: 'Set Location',
                  )),
              SizedBox(
                height: 330.h,
              ),
              Center(
                  child: SubmitButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileReadyPage()));
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
      required this.onPressed,
      this.isSelected = false,
      required this.text});

  final VoidCallback onPressed;
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
            border:
                isSelected ? Border.all(width: 2, color: Colors.green) : null,
            color: Theme.of(context).canvasColor.withOpacity(1),
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
            ]),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Image.asset('assets/icons/location.png'),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "Your Location",
                  style: TextStyle(
                      color: themeData.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          themeData.scaffoldBackgroundColor.withOpacity(0.5)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: TextStyle(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
