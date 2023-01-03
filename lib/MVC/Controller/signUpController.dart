import 'dart:convert';
import 'dart:io';
import 'package:clump_app/LocalData/GetStorage_utils.dart';
import 'package:clump_app/LocalData/keyStorage.dart';
import 'package:clump_app/MVC/Model/baseModel.dart';
import 'package:clump_app/Network/api_endpoint.dart';
import 'package:clump_app/Network/api_response.dart';
import 'package:clump_app/Routes/appRoutes.dart';
import 'package:clump_app/Utils/colorsConst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> contactController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> conPasswordController = TextEditingController().obs;

  signUpPostAPI() async {
    try {
      String url = urlBase + urlPostRegister;
      final apiReq = Request();

      dynamic body = {
        'full_name': nameController.value.text.trim(),
        'contactNo': contactController.value.text.trim(),
        'user_name': emailController.value.text.trim(),
        'password': passwordController.value.text.trim(),
        'confirm_password': conPasswordController.value.text.trim(),
        'cmpName': 'm',
        'cmp_address': 'm'
      };

      await apiReq.postAPIwithoutAuth(url, body).then((value) async {
        Get.back();
        if (value.statusCode == 200) {
          Map<String, dynamic> userModel = json.decode(value.body);
          BaseModel model = BaseModel.fromJson(userModel);
          GetStorageutils.setString(key: KeyStorage.loginUser, value: 'active');

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
