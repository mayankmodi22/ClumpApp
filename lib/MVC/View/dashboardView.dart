import 'package:cached_network_image/cached_network_image.dart';
import 'package:clump_app/MVC/Controller/dashboardController.dart';
import 'package:clump_app/MVC/Model/categortModel.dart';
import 'package:clump_app/MVC/View/drawerView.dart';
import 'package:clump_app/MVC/View/editProfileView.dart';
import 'package:clump_app/MVC/View/leadsView.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:clump_app/Utils/fontConst.dart';
import 'package:clump_app/Utils/imageConst.dart';
import 'package:clump_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({super.key});

  TextEditingController companyNameController = TextEditingController();

  TextEditingController companyAddressController = TextEditingController();

  List<CategoryModel> listCategory = [
    CategoryModel(image: categoryfillterIcon, title: "Leads"),
    CategoryModel(image: categorTaskIcon, title: "Tasks"),
    CategoryModel(image: null, title: "Follow Up Lead"),
    CategoryModel(image: null, title: "Due Follow up Lead")
  ];

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
                padding: EdgeInsets.only(left: 22.w, right: 18.w),
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
                            ),
                            SvgPicture.asset(alramIcon,
                                fit: BoxFit.cover, width: 35.h, height: 35.h)
                          ],
                        ),
                      ),
                      SizedBox(height: 37.36.h),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: CachedNetworkImage(
                              key: UniqueKey(),
                              maxHeightDiskCache: 800,
                              maxWidthDiskCache: 800,
                              imageUrl: controller.userModel.value.data?.user
                                      ?.profileImage ??
                                  "",
                              height: 69.35.h,
                              fit: BoxFit.cover,
                              width: 69.35.h,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      SvgPicture.asset(
                                icon_place_holder,
                                height: 69.35.h,
                                fit: BoxFit.cover,
                                width: 69.35.h,
                              ),
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(
                                icon_place_holder,
                                height: 69.35.h,
                                fit: BoxFit.cover,
                                width: 69.35.h,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.65),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 210.w,
                                      child: Text(
                                        controller.userModel.value.data?.user
                                                ?.fullName ??
                                            "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontFamily: fontRobotoDisplayBold,
                                            color: colorFFFFF),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 210.w,
                                      child: Text(
                                        controller.userModel.value.data?.user
                                                ?.userName ??
                                            "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily:
                                                fontRobotoDisplayRegular,
                                            color: colorFFFFF),
                                      ),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(EditProfileView());
                                  },
                                  child: SvgPicture.asset(editIcon,
                                      fit: BoxFit.cover,
                                      width: 35.h,
                                      height: 35.h),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 69.54.h),
                      GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // mainAxisExtent: 290,
                            mainAxisSpacing: 20.h,
                            childAspectRatio: 0.9.w,
                            crossAxisSpacing: 40.h),
                        itemCount: listCategory.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              if (i == 0) {
                                Get.to(LeadsView());
                              }
                            },
                            child: Container(
                              decoration: shadowDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  listCategory[i].image != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                          child: SvgPicture.asset(
                                            listCategory[i].image ?? "",
                                            height: 30.h,
                                            fit: BoxFit.cover,
                                            width: 37.58.h,
                                          ))
                                      : SizedBox(
                                          width: 37.58.h,
                                          height: 30.h,
                                        ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    listCategory[i].title ?? "",
                                    textScaleFactor: 1.0,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: fontRobotoDisplayMedium,
                                        fontSize: 18.sp,
                                        color: color1D1D1D),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
