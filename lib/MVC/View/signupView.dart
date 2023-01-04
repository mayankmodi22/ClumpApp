import 'package:clump_app/MVC/Controller/signUpController.dart';
import 'package:clump_app/MVC/View/companyDetailsView.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:clump_app/Utils/fontConst.dart';
import 'package:clump_app/Utils/stringConst.dart';
import 'package:clump_app/Utils/validationExtension.dart';
import 'package:clump_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({super.key});

  final _formSignUpPage = GlobalKey<FormState>();
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
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 21.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 58.h),
                  Text(signUpTxt,
                      style: TextStyle(
                          letterSpacing: 0.8,
                          color: colorFFFFF,
                          fontSize: 30.sp,
                          fontFamily: fontRobotoDisplayRegular)),
                  SizedBox(height: 13.h),
                  Text(descSignUpTxt,
                      style: TextStyle(
                          color: colorFFFFF,
                          fontSize: 15.sp,
                          fontFamily: fontRobotoDisplayRegular)),
                  SizedBox(height: 72.h),
                  Container(
                    width: 335.w,
                    decoration: shadowDecoration,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.h),
                      child: Form(
                        key: _formSignUpPage,
                        child: Column(
                          children: [
                            SizedBox(height: 30.5.h),
                            textField(
                                controller: controller.nameController.value,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Enter valid Full Name';
                                  }
                                  return null;
                                },
                                hintTxt: hintNameTxt),
                            SizedBox(height: 14.5.h),
                            textFieldPhone(
                                controller: controller.contactController.value,
                                validator: (val) {
                                  if (val!.length != 10) {
                                    return 'Enter valid Contact No';
                                  }
                                  return null;
                                },
                                hintTxt: hintcontactTxt),
                            SizedBox(height: 14.5.h),
                            textField(
                                controller: controller.emailController.value,
                                validator: (val) {
                                  if (!val!.isValidEmail) {
                                    return 'Enter valid email';
                                  }
                                  return null;
                                },
                                hintTxt: hintEmailTxt),
                            SizedBox(height: 14.5.h),
                            textField(
                                controller: controller.passwordController.value,
                                validator: (val) {
                                  if (!val!.isValidPassword) {
                                    return 'Enter valid Password';
                                  }
                                  return null;
                                },
                                hintTxt: passwordTxt),
                            SizedBox(height: 14.5.h),
                            textField(
                                controller:
                                    controller.conPasswordController.value,
                                validator: (val) {
                                  if (!val!.isValidPassword ||
                                      controller.passwordController.value.text
                                              .trim() !=
                                          controller
                                              .conPasswordController.value.text
                                              .trim()) {
                                    return 'Enter valid Confirm Password';
                                  }
                                  return null;
                                },
                                hintTxt: hintConfirmPasswordTxt),
                            SizedBox(height: 30.5.h),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_formSignUpPage.currentState!
                                        .validate()) {
                                      FocusScope.of(context).unfocus();
                                      onLoading(context);
                                      controller.signUpPostAPI();
                                    }
                                  },
                                  child: Container(
                                    width: 150.w,
                                    height: 51.h,
                                    decoration: BoxDecoration(
                                        color: color60A053,
                                        borderRadius:
                                            BorderRadius.circular(6.r)),
                                    child: Center(
                                        child: Text(nextTxt,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: colorFFFFF,
                                                fontFamily:
                                                    fontRobotoDisplayRegular))),
                                  ),
                                ),
                                Container(
                                  width: 150.w,
                                  height: 51.h,
                                  // decoration: BoxDecoration(
                                  //     color: color60A053,
                                  //     borderRadius: BorderRadius.circular(6.r)),
                                  child: Center(
                                      child: Text(cancelTxt,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: color60A053,
                                              fontFamily:
                                                  fontRobotoDisplayRegular))),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
