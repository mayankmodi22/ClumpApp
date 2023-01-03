import 'package:cached_network_image/cached_network_image.dart';
import 'package:clump_app/MVC/View/companyDetailsView.dart';
import 'package:clump_app/MVC/View/drawerView.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:clump_app/Utils/fontConst.dart';
import 'package:clump_app/Utils/imageConst.dart';
import 'package:clump_app/Utils/stringConst.dart';
import 'package:clump_app/widget/borderWidget.dart';
import 'package:clump_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrower(),
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
                      SizedBox(height: 13.25.h),
                      Padding(
                        padding: EdgeInsets.only(left: 0.5.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                child: SvgPicture.asset(homeIcon,
                                    fit: BoxFit.cover,
                                    width: 22.5.h,
                                    height: 17.5.h),
                              )
                            ]),
                      ),
                      SizedBox(height: 17.36.h),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: CachedNetworkImage(
                                key: UniqueKey(),
                                maxHeightDiskCache: 800,
                                maxWidthDiskCache: 800,
                                imageUrl: profileNetwork,
                                height: 100.h,
                                fit: BoxFit.cover,
                                width: 100.h,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        SvgPicture.asset(icon_place_holder,
                                            height: 100.h,
                                            fit: BoxFit.cover,
                                            width: 100.h),
                                errorWidget: (context, url, error) =>
                                    SvgPicture.asset(icon_place_holder,
                                        height: 100.h,
                                        fit: BoxFit.cover,
                                        width: 100.h),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                    width: 35.h,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SvgPicture.asset(
                                        cameraIcon,
                                        width: 20.h,
                                        height: 20.h,
                                        fit: BoxFit.cover,
                                        color: color60A053,
                                      ),
                                    )))
                          ],
                        ),
                      ),
                      SizedBox(height: 53.89.h),
                      Container(
                        width: 335.w,
                        decoration: shadowDecoration,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.h),
                          child: Column(
                            children: [
                              SizedBox(height: 30.5.h),
                              textField(
                                  controller: nameController,
                                  hintTxt: hintNameTxt),
                              SizedBox(height: 14.5.h),
                              textField(
                                  controller: contactController,
                                  hintTxt: hintcontactTxt),
                              SizedBox(height: 14.5.h),
                              textField(
                                  controller: emailController,
                                  hintTxt: hintEmailTxt),
                              SizedBox(height: 14.5.h),
                              textField(
                                  controller: passwordController,
                                  hintTxt: passwordTxt),
                              SizedBox(height: 32.5.h),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(CompanyDetailsView());
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
