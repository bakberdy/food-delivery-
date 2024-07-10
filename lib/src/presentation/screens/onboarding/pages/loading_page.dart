import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/onboarding/pages/onboarding_page.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    navigateToOnboarding();
  }

  void navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 10));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1.5,
                    child: Image.asset(
                        fit: BoxFit.cover, "assets/images/bg_pattern.png"))),
            Center(
              child: SizedBox(
                  width: 188.w,
                  height: 200.h,
                  child: Image.asset("assets/images/logo.png")),
            )
          ],
        ),
      ),
    );
  }
}
