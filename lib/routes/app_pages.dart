// lib/routes/app_pages.dart
import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import '../bindings/home_binding.dart';
import '../constants/app_constants.dart';
import '../views/auth/login_view.dart';
import '../views/auth/role_selection_view.dart';
import '../views/auth/signup_view.dart';
import '../views/home/home_view.dart';
import '../views/splash/splash_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppConstants.splashRoute, page: () => const SplashView()),
    GetPage(
      name: AppConstants.loginRoute,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppConstants.signupRoute,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppConstants.roleSelectionRoute,
      page: () => const RoleSelectionView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppConstants.homeRoute,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
