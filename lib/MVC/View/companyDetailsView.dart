import 'package:clump_app/MVC/View/dashboardView.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:clump_app/Utils/fontConst.dart';
import 'package:clump_app/Utils/stringConst.dart';
import 'package:clump_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompanyDetailsView extends StatefulWidget {
  const CompanyDetailsView({super.key});

  @override
  State<CompanyDetailsView> createState() => _CompanyDetailsViewState();
}

class _CompanyDetailsViewState extends State<CompanyDetailsView> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
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
                  SizedBox(height: 52.h),
                  Text(companyDetailsTxt,
                      style: TextStyle(
                          letterSpacing: 0.8,
                          color: colorFFFFF,
                          fontSize: 30.sp,
                          fontFamily: fontRobotoDisplayRegular)),
                  SizedBox(height: 13.h),
                  Text(descCompanyDetailsTxt,
                      style: TextStyle(
                          color: colorFFFFF,
                          fontSize: 15.sp,
                          fontFamily: fontRobotoDisplayRegular)),
                  SizedBox(height: 72.h),
                  Container(
                    width: 335.w,
                    decoration: shadowDecoration,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.h),
                      child: Column(
                        children: [
                          SizedBox(height: 30.5.h),
                          textFieldSmall(
                              controller: companyNameController,
                              hintTxt: companyNameTxt),
                          SizedBox(height: 14.5.h),
                          textFieldSmall(
                              controller: companyAddressController,
                              hintTxt: companyAddressTxt),
                          SizedBox(height: 27.5.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(compnayLogoTxt,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: fontRobotoDisplayMedium)),
                          ),
                          SizedBox(height: 17.h),
                          Container(
                            width: double.infinity,
                            height: 56.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: color60A053),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  width: 99.w,
                                  height: 29.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: color60A053, width: 0.5),
                                      borderRadius: BorderRadius.circular(6.r)),
                                  child: Center(
                                      child: Text(chooseFileTxt,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: colorA4A4A4,
                                              fontFamily:
                                                  fontRobotoDisplayRegular))),
                                ),
                                Center(
                                    child: Text(chosenFileTxt,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: colorA4A4A4,
                                            fontFamily:
                                                fontRobotoDisplayRegular))),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(DashboardView());
                                },
                                child: Container(
                                  width: 150.w,
                                  height: 51.h,
                                  decoration: BoxDecoration(
                                      color: color60A053,
                                      borderRadius: BorderRadius.circular(6.r)),
                                  child: Center(
                                      child: Text(submitTxt,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: colorFFFFF,
                                              fontFamily:
                                                  fontRobotoDisplayRegular))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
