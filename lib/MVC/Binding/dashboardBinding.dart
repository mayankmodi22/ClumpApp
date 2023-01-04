import 'package:clump_app/MVC/Controller/dashboardController.dart';
import 'package:clump_app/MVC/Controller/loginController.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
