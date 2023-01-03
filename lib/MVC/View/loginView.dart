import 'package:clump_app/MVC/Controller/loginController.dart';
import 'package:clump_app/Routes/appPages.dart';
import 'package:clump_app/Routes/appRoutes.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:clump_app/Utils/fontConst.dart';
import 'package:clump_app/Utils/stringConst.dart';
import 'package:clump_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clump_app/Utils/validationExtension.dart';
import 'package:get/get.dart';
import 'signupView.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final _formLoginPage = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: colorFFFFF, // navigation bar color
      statusBarColor: color60A053, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return Scaffold(
        body: Stack(
      children: [
        Container(color: color60A053, height: 296.h),
        SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formLoginPage,
              child: Padding(
                padding: EdgeInsets.only(left: 21.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 58.h),
                    Text(loginTxt,
                        style: TextStyle(
                            letterSpacing: 0.8,
                            color: colorFFFFF,
                            fontSize: 30.sp,
                            fontFamily: fontRobotoDisplayRegular)),
                    SizedBox(height: 13.h),
                    Text(welcomeTxt,
                        style: TextStyle(
                            color: colorFFFFF,
                            fontSize: 15.sp,
                            fontFamily: fontRobotoDisplayRegular)),
                    SizedBox(height: 72.h),
                    Container(
                      width: 335.w,
                      decoration: shadowDecoration,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Column(
                          children: [
                            SizedBox(height: 30.5.h),
                            textField(
                                controller:
                                    controller.emailOrMobileController.value,
                                validator: (val) {
                                  if (!val!.isValidEmail) {
                                    return 'Enter valid email';
                                  }
                                  return null;
                                },
                                hintTxt: emailTxt),
                            SizedBox(height: 14.5.h),
                            textField(
                                controller: controller.passwordController.value,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Enter valid Password';
                                  }
                                  return null;
                                },
                                hintTxt: passwordTxt),
                            SizedBox(height: 39.h),
                            InkWell(
                              onTap: () {
                                if (_formLoginPage.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  onLoading(context);
                                  controller.loginPostAPI();
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 51.h,
                                decoration: BoxDecoration(
                                    color: color60A053,
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: Center(
                                    child: Text(loginTxt,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: colorFFFFF,
                                            fontFamily:
                                                fontRobotoDisplayRegular))),
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(forgotTxt,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: colorA4A4A4,
                                      fontFamily: fontRobotoDisplayRegular)),
                            ),
                            SizedBox(height: 26.h)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 235.h),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.signUp);
                        },
                        child: SizedBox(
                          height: 35.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  signUpAccountTxt,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: colorA4A4A4,
                                      fontFamily: fontRobotoDisplayRegular),
                                ),
                                Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: color777777,
                                      fontFamily: fontRobotoDisplayMedium),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
