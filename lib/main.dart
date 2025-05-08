import 'package:emp_mobile/controller/AuthController.dart';
import 'package:emp_mobile/middleware/AuthMiddleware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();
  Get.put(AuthController());
  runApp(MainApp());;
}



class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final auth_controller = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  void initialize() async{
    await Future.delayed(const Duration(seconds: 2)); // Give time to see splash
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: auth_controller.isLogin.value ? "/home" : "/login",
      getPages: appPages,
    ));
  }
}
