import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/authentication/pages/sign_up/sign_up_process_page.dart';

import '../../../../widgets/auth_textfield.dart';
import '../../../../widgets/screen_wrapper.dart';
import '../../../../widgets/submit_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.switchScreen});

  final VoidCallback switchScreen;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Min 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ScreenWrapper(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 45.h,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 220.h,
                  child: Image.asset("assets/images/logo.png")),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Sign Up For Free',
                style: TextStyle(
                    color: themeData.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 40.h,
              ),
              AuthTextField(
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
                hintText: 'Email',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 15,
              ),
              AuthTextField(
                obscureText: true,
                validator: passwordValidator,
                hintText: 'Password',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 15,
              ),
              AuthTextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: passwordValidator,
                hintText: 'Confirm Password',
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 30.h,
              ),
              SubmitButton(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpProcessPage()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpProcessPage()));
                    }
                  },
                  label: 'Create Account'),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: widget.switchScreen,
                child: Text(
                  'already have an account?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: const Color(0xff53E88B),
                      color: const Color(0xff53E88B),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
