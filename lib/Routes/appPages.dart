import 'package:clump_app/MVC/Binding/dashboardBinding.dart';
import 'package:clump_app/MVC/Binding/loginBinding.dart';
import 'package:clump_app/MVC/Binding/signupBinding.dart';
import 'package:clump_app/MVC/Controller/loginController.dart';
import 'package:clump_app/MVC/Controller/signUpController.dart';
import 'package:clump_app/MVC/View/companyDetailsView.dart';
import 'package:clump_app/MVC/View/dashboardView.dart';
import 'package:clump_app/MVC/View/editProfileView.dart';
import 'package:clump_app/MVC/View/leadsView.dart';
import 'package:clump_app/MVC/View/loginView.dart';
import 'package:clump_app/MVC/View/signupView.dart';
import 'package:clump_app/MVC/View/splashScreenView.dart';
import 'package:clump_app/Routes/appRoutes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashScreenView(),
    ),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.signUp,
        page: () => SignUpView(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRoutes.dashboard,
        page: () => DashboardView(),
        binding: DashboardBinding()),
    GetPage(
      name: AppRoutes.companyDetails,
      page: () => const CompanyDetailsView(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
    ),
    GetPage(
      name: AppRoutes.leads,
      page: () => const LeadsView(),
    )
  ];
}
