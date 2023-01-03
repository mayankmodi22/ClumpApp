import 'package:clump_app/Utils/colorsConst.dart';
import 'package:clump_app/Utils/fontConst.dart';
import 'package:clump_app/Utils/imageConst.dart';
import 'package:clump_app/widget/borderWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Loading Bar
void onLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child:
            // Image.asset(icon_waiting, height: 80.w, width: 80.h)
            SizedBox(
          height: 200.w,
          width: 200.h,
          child: const SpinKitCircle(
            color: color00000D,
            size: 58,
          ),
        ),
      );
    },
  );
}

//Custom TextField
Widget textField(
    {required TextEditingController controller,
    String? hintTxt,
    String? Function(String?)? validator}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    validator: validator,
    style: TextStyle(
        color: color00000D,
        fontFamily: fontRobotoDisplayRegular,
        fontSize: 15.sp),
    decoration: InputDecoration(
      enabledBorder: lineBorder,
      focusedBorder: focusBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusErrorBorder,
      isDense: true,
      hintText: hintTxt ?? "",
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.5.h),
      hintStyle: TextStyle(
          color: colorA4A4A4,
          fontFamily: fontRobotoDisplayMedium,
          fontSize: 15.sp),
      border: InputBorder.none,
    ),
    cursorColor: colorA4A4A4,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.next,
  );
}

//Custom TextField
Widget textFieldPhone(
    {required TextEditingController controller,
    String? hintTxt,
    String? Function(String?)? validator}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    validator: validator,
    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+$'))],
    style: TextStyle(
        color: color00000D,
        fontFamily: fontRobotoDisplayRegular,
        fontSize: 15.sp),
    decoration: InputDecoration(
      enabledBorder: lineBorder,
      focusedBorder: focusBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusErrorBorder,
      isDense: true,
      hintText: hintTxt ?? "",
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.5.h),
      hintStyle: TextStyle(
          color: colorA4A4A4,
          fontFamily: fontRobotoDisplayMedium,
          fontSize: 15.sp),
      border: InputBorder.none,
    ),
    cursorColor: colorA4A4A4,
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.next,
  );
}

Widget textFieldIcon(
    {required TextEditingController controller,
    String? hintTxt,
    required String? icon}) {
  return TextField(
    controller: controller,
    style: TextStyle(
        color: color00000D,
        fontFamily: fontRobotoDisplayRegular,
        fontSize: 12.sp),
    decoration: InputDecoration(
      suffixIcon: SizedBox(
          width: 16.h,
          height: 16.h,
          child: Center(child: SvgPicture.asset(icon!, fit: BoxFit.cover))),
      enabledBorder: lineBorderGrey,
      focusedBorder: focusBorderGrey,
      errorBorder: errorBorderGrey,
      focusedErrorBorder: focusErrorBorderGrey,
      isDense: true,
      hintText: hintTxt ?? "",
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.5.h),
      hintStyle: TextStyle(
          color: colorA4A4A4,
          fontFamily: fontRobotoDisplayMedium,
          fontSize: 12.sp),
      border: InputBorder.none,
    ),
    cursorColor: colorA4A4A4,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.next,
  );
}

Widget textFieldSmall(
    {required TextEditingController controller, String? hintTxt}) {
  return TextField(
    controller: controller,
    style: TextStyle(
        color: color00000D,
        fontFamily: fontRobotoDisplayRegular,
        fontSize: 15.sp),
    decoration: InputDecoration(
      enabledBorder: lineBorder,
      focusedBorder: focusBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusErrorBorder,
      isDense: true,
      hintText: hintTxt ?? "",
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.5.h),
      hintStyle: TextStyle(
          color: colorA4A4A4,
          fontFamily: fontRobotoDisplayMedium,
          fontSize: 15.sp),
      border: InputBorder.none,
    ),
    cursorColor: colorA4A4A4,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.next,
  );
}

final shadowDecoration = BoxDecoration(boxShadow: const [
  BoxShadow(
    color: colorA4A4A4,
    offset: Offset(0, 3.0),
    blurRadius: 8,
    spreadRadius: 0,
  ), //Bo
], color: colorFFFFF, borderRadius: BorderRadius.circular(12.r));
