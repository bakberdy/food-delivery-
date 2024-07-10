import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/src/presentation/screens/authentication/pages/sign_up/set_location_page.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../widgets/screen_wrapper.dart';
import '../../../../widgets/submit_button.dart';

class UploadPreview extends StatefulWidget {
  const UploadPreview({super.key});

  @override
  State<UploadPreview> createState() => _UploadPreviewState();
}

class _UploadPreviewState extends State<UploadPreview> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();
  bool isUploadedPhoto = false;

  Future<void> _imgFromCamera() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _image = image;
          isUploadedPhoto = true;
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
  }

  Future<void> _imgFromGallery() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image;
          isUploadedPhoto = true;
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
  }

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
                  "Upload Your Photo\nProfile",
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
                height: 20.h,
              ),
              isUploadedPhoto
                  ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          height: 250.h,
                          width: 250.w,
                          child: Image.file(
                            File(_image!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                            height: 130.h,
                            width: double.infinity,
                            child: _ImageButton(
                              src: 'assets/icons/gallery.png',
                              onPressed: () {
                                _imgFromGallery();
                              },
                              text: 'From Gallery',
                            )),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                            height: 130.h,
                            width: double.infinity,
                            child: _ImageButton(
                              src: 'assets/icons/camera.png',
                              onPressed: () {
                                _imgFromCamera();
                              },
                              text: 'Take Photo',
                            )),
                      ],
                    ),
              SizedBox(
                height: 140.h,
              ),
              Center(
                  child: SubmitButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SetLocationPage()));
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
      required this.src,
      required this.onPressed,
      this.isSelected = false,
      required this.text});

  final String src;
  final VoidCallback onPressed;
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
            ],
            border:
                isSelected ? Border.all(width: 2, color: Colors.green) : null,
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                src,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                text,
                style: TextStyle(
                    color: themeData.primaryColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 14.sp),
              ),
            ],
          )),
    );
  }
}
