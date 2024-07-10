import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
  });

  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final keyboardType;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(2, 2),
        ),
      ]),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          fillColor: themeData.canvasColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff3B3B3B)),
        ),
      ),
    );
  }
}
