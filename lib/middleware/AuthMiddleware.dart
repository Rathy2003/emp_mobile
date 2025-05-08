import 'package:emp_mobile/controller/AuthController.dart';
import 'package:emp_mobile/page/login_page.dart';
import 'package:emp_mobile/page/profile_page.dart';
import 'package:emp_mobile/page/qrscanner_page.dart';
import 'package:emp_mobile/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    return authController.isLogin.value ? null : RouteSettings(name: '/login');
  }
}

final List<GetPage> appPages = [
  GetPage(
      name: "/login",
      page: () => LoginPage()
  ),
  GetPage(
      name: "/home",
      page: () => HomeScreen(),
      middlewares: [AuthMiddleware()]
  ),
  GetPage(
      name: "/profile",
      page: () => ProfilePage(),
      middlewares: [AuthMiddleware()]
  ),
  GetPage(
      name: "/qrscanner",
      page: () => QRViewExample()
  )
];