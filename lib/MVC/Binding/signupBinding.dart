import 'package:clump_app/MVC/Controller/loginController.dart';
import 'package:clump_app/MVC/Controller/signUpController.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
