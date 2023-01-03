import 'package:cached_network_image/cached_network_image.dart';
import 'package:clump_app/MVC/View/drawerView.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:clump_app/Utils/fontConst.dart';
import 'package:clump_app/Utils/imageConst.dart';
import 'package:clump_app/Utils/stringConst.dart';
import 'package:clump_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeadsView extends StatefulWidget {
  const LeadsView({super.key});

  @override
  State<LeadsView> createState() => _LeadsViewState();
}

class _LeadsViewState extends State<LeadsView> {
  TextEditingController searchController = TextEditingController();

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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrower(),
        body: Stack(
          children: [
            Container(color: color60A053, height: 90.h),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 13.25.h),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w, right: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: SvgPicture.asset(homeIcon,
                              fit: BoxFit.cover, width: 22.5.h, height: 17.5.h),
                        ),
                        Text(
                          leadsTxt,
                          style: TextStyle(
                              letterSpacing: 0.9,
                              fontSize: 19.sp,
                              fontFamily: fontRobotoDisplayRegular,
                              color: colorFFFFF),
                        ),
                        SvgPicture.asset(addIconSvg,
                            fit: BoxFit.cover, width: 17.97.h, height: 17.97.h)
                      ],
                    ),
                  ),
                  SizedBox(height: 37.36.h),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w, right: 18.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 223.w,
                          child: textFieldIcon(
                              icon: searchIcon,
                              controller: searchController,
                              hintTxt: searchHint),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 46.h,
                          width: 44.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: colorD4D4D4),
                              borderRadius: BorderRadius.circular(8)),
                          child: SizedBox(
                              height: 15.96.h,
                              width: 20.h,
                              child: Center(
                                  child: SvgPicture.asset(filtterSmall))),
                        ),
                        SizedBox(width: 10.w),
                        Center(
                            child: SvgPicture.asset(
                          transactionIcon,
                          height: 44.h,
                          width: 46.h,
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 31.h),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: 22.w, right: 18.w, top: 8.h, bottom: 8.h),
                          decoration: shadowDecoration,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 17.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Ankit Patel",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: color1D1D1D,
                                          fontFamily: fontRobotoDisplayBold),
                                    ),
                                    Container(
                                        height: 34.h,
                                        width: 120.h,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: color60A053),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: const Center(
                                          child: Text("Open",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily:
                                                      fontRobotoDisplayRegular,
                                                  color: color1D1D1D)),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Text("iBoon Technologies",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: color646464,
                                        fontFamily: fontRobotoDisplayRegular)),
                                SizedBox(height: 4.h),
                                Text("JustDial",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: color646464,
                                        fontFamily: fontRobotoDisplayRegular)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
