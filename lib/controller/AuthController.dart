import 'package:get/get.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{
  var isLogin = false.obs;
  final box = GetStorage();
  final String secreteKey = "69679f3b9febe34102ecea9857c85ea33e6db8cdc987aa81b78273dd966abc996ba72119e227f5866d87b09dcc61c4ade72d6e57655bee2828f6f475d09567e01c4565f118d25303f9d5a722a412526a9fb51cf4768b2db93fd6e18a15033b5dbb7028748e4c93c1e05d16d543b07514ac21b97e31eceb6aae7f8b8ef860e9574044a033f389c89857019434a13365f3f7e65875a010c9719a9ee61dddd0e7ace785345a05254e5cadd82cdcf60329442d02f7fd342830e924fdd1b3188bf4002a5a2ab5e26eb345738153b56521d3312049c813585e69b58573c83ec0defccaad2136ddc998805c122101bb5b140e0b83b92fb27194d28681015caf8b6a41ac";

  @override
  void onInit(){
    super.onInit();
    Future.delayed(Duration.zero,(){
      checkAuthStatus();
    });

  }

  void checkAuthStatus(){
    final token = box.read("_token");
    if (token != null && token.isNotEmpty){
      final jwt = JWT.decode(token);
      if(jwt.payload['email'] == "admin@gmail.com" && jwt.payload['password'] == "admin"){
        isLogin.value = true;
        Get.offAllNamed("/home");
      }
    }
  }

  void login(String email,String password){
    if(email == "admin@gmail.com" && password == "admin"){
      final jwt = JWT({
        'email':email,
        'password':password
      });
      
      final token = jwt.sign(SecretKey(secreteKey));
      box.write("_token", token);
      isLogin.value = true;
      Get.offAllNamed("/home");
    }
  }

  void logout(){
    isLogin.value = false;
    box.remove("_token");
    Get.offAllNamed("/login");
  }
}