import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/main/home.dart';

import 'core/theme/theme.dart';

void main() {

  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: child
        );
      },
      designSize: const Size(375, 812),
      child: const Home(),
    );
  }
}
