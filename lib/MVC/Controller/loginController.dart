import 'dart:convert';
import 'dart:io';
import 'package:clump_app/LocalData/GetStorage_utils.dart';
import 'package:clump_app/LocalData/keyStorage.dart';
import 'package:clump_app/MVC/Model/baseModel.dart';
import 'package:clump_app/MVC/Model/userModel.dart';
import 'package:clump_app/Network/api_endpoint.dart';
import 'package:clump_app/Network/api_response.dart';
import 'package:clump_app/Routes/appRoutes.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailOrMobileController =
      TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  loginPostAPI() async {
    try {
      String url = urlBase + urlPostLogin;
      final apiReq = Request();

      dynamic body = {
        'email_or_mobile': emailOrMobileController.value.text.trim(),
        'password': passwordController.value.text.trim(),
        'device_id': 'string',
        'device_type': 'string',
        'fcm_token': 'string'
      };

      await apiReq.postAPIwithoutAuth(url, body).then((value) async {
        Get.back();
        if (value.statusCode == 200) {
          Map<String, dynamic> userModel = json.decode(value.body);
          BaseModel model = BaseModel.fromJson(userModel);
          GetStorageutils.setString(key: KeyStorage.user, value: value.body);

          Get.offAllNamed(AppRoutes.dashboard);
        } else {
          Map<String, dynamic> userModel = json.decode(value.body);
          BaseModel model = BaseModel.fromJson(userModel);
          Get.snackbar("Error", model.message.toString(),
              backgroundColor: colorRed, snackPosition: SnackPosition.BOTTOM);
        }
      });
    } on SocketException catch (_) {
      Get.back();
      rethrow;
    }
  }
}
