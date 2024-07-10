
import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({super.key, required this.child,this.appbar});
  final Widget child;
  final Widget? appbar;

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
            SingleChildScrollView(
              child: Column(
                children: [
                  appbar??const SizedBox(height: 0,),
                  child,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

