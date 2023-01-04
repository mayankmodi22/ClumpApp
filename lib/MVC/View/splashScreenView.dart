import 'package:clump_app/LocalData/GetStorage_utils.dart';
import 'package:clump_app/LocalData/keyStorage.dart';
import 'package:clump_app/MVC/View/loginView.dart';
import 'package:clump_app/Routes/appRoutes.dart';
import 'package:clump_app/Utils/ImageConst.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callScreen();
  }

  callScreen() async {
    GetStorageutils.userIFNull(key: KeyStorage.user, value: 'UnActive');

    Future.delayed(const Duration(seconds: 2), () async {
      redirect();
    });
  }

  redirect() {
    var data = GetStorageutils.getValue(key: KeyStorage.user);
    if (data == 'UnActive') {
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: color60A053, // navigation bar color
      statusBarColor: color60A053, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return Scaffold(
      backgroundColor: color60A053,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(appNamePng,
                fit: BoxFit.cover, height: 92.h, width: 232.w),
          ],
        ),
      ),
    );
  }
}
