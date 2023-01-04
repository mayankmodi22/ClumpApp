import 'package:clump_app/LocalData/getStorage_utils.dart';
import 'package:clump_app/LocalData/keyStorage.dart';
import 'package:clump_app/MVC/Model/userModel.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUserTOLocal();
  }

  getUserTOLocal() async {
    var model = GetStorageutils.getValue(key: KeyStorage.user);
    userModel.value = userModelFromJson(model.toString());
  }
}
