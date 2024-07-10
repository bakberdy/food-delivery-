import 'package:flutter/material.dart';
import 'package:food_ninja/src/presentation/screens/authentication/pages/sign_in/sign_in_page.dart';

import '../pages/sign_up/sign_up_page.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool _isSelectedSignInScreen = true;

  void switchScreen(){
    setState(() {
      _isSelectedSignInScreen = !_isSelectedSignInScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isSelectedSignInScreen?SignInPage(switchScreen: switchScreen,):SignUpPage(switchScreen:  switchScreen,);
  }
}
