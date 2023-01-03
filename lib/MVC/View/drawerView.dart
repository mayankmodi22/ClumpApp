import 'package:clump_app/LocalData/GetStorage_utils.dart';
import 'package:clump_app/LocalData/keyStorage.dart';
import 'package:clump_app/Routes/appRoutes.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:clump_app/Utils/fontConst.dart';
import 'package:clump_app/Utils/imageConst.dart';
import 'package:clump_app/Utils/stringConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomDrower extends StatefulWidget {
  const CustomDrower({super.key});

  @override
  State<CustomDrower> createState() => _CustomDrowerState();
}

class _CustomDrowerState extends State<CustomDrower> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.5.h),
                    Image.asset(
                      appNamePng,
                      color: color60A053,
                      fit: BoxFit.cover,
                      height: 50.h,
                      width: 127.w,
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      height: 1,
                      color: color777777,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //Text
              //),
              ListTile(
                leading: SvgPicture.asset(
                  listIcon,
                  height: 16.14.h,
                  fit: BoxFit.cover,
                  width: 16.14.w,
                ),
                title: Text(
                  leadsTxt,
                  style: TextStyle(
                      fontFamily: fontRobotoDisplayRegular,
                      fontSize: 16.sp,
                      color: color646464),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  lockIcon,
                  height: 16.14.h,
                  fit: BoxFit.fill,
                  width: 16.14.w,
                ),
                title: Text(
                  changePasswordDrawerTxt,
                  style: TextStyle(
                      fontFamily: fontRobotoDisplayRegular,
                      fontSize: 16.sp,
                      color: color646464),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ]),
            const Expanded(child: SizedBox(height: 20)),
            Container(
              height: 62.h,
              color: color60A053,
              child: ListTile(
                leading: SvgPicture.asset(
                  logoutIcon,
                  height: 16.14.h,
                  fit: BoxFit.cover,
                  width: 16.14.w,
                ),
                title: Text(
                  logoutDrawerTxt,
                  style: TextStyle(
                      fontFamily: fontRobotoDisplayRegular,
                      fontSize: 16.sp,
                      color: colorFFFFF),
                ),
                onTap: () {
                  GetStorageutils.setString(
                      key: KeyStorage.loginUser, value: '');

                  Get.offAllNamed(AppRoutes.login);
                },
              ),
            )
          ],
        ),
      ),
    ); //Drawer
  }
}
