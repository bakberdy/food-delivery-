import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconLabelButton extends StatelessWidget {
  const IconLabelButton({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.onTap,
  });

  final String label;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
            ],
            color: themeData.canvasColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 14.h,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              label,
              style: TextStyle(
                  color: themeData.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
