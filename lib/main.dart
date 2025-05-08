import 'package:emp_mobile/controller/AuthController.dart';
import 'package:emp_mobile/middleware/AuthMiddleware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthController());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final auth_controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: auth_controller.isLogin.value ? "/home" : "/login",
      getPages: appPages,
    ));
  }
}
