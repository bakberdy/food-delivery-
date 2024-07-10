import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/widgets/screen_wrapper.dart';
import 'package:food_ninja/src/presentation/widgets/submit_button.dart';

import '../../../../widgets/auth_textfield.dart';
import '../../../../widgets/icon_label_button.dart';
import '../reset_password/reset_password_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.switchScreen});

  final VoidCallback switchScreen;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {


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
    if (value.length<6) {
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
                height: 70.h,
              ),
              AuthTextField(
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
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Or Continue With',
                style: TextStyle(
                    color: themeData.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: IconLabelButton(
                      label: 'Meta',
                      imageUrl: 'https://pngimg.com/uploads/meta/small/meta_PNG5.png',
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 18.w,),
                  Expanded(
                    child: IconLabelButton(
                      label: 'Google',
                      imageUrl: 'https://cdn-icons-png.flaticon.com/128/281/281764.png',
                      onTap: () {},
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPasswordPage()));
                },
                child: Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: const Color(0xff53E88B),
                      color: const Color(0xff53E88B),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp),
                ),
              ),
              SizedBox(height: 30.h,),
              SubmitButton(onTap: (){
                _formKey.currentState?.validate()??false;
              }, label: 'Login'),
              SizedBox(height: 20.h,),
              InkWell(
                onTap: widget.switchScreen,
                child: Text(
                  'you don\'t have an account?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: const Color(0xff53E88B),
                      color: const Color(0xff53E88B),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp),
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    ));
  }
}
