import 'package:emp_mobile/controller/AuthController.dart';
import 'package:emp_mobile/utils/colors.dart';
import 'package:emp_mobile/widgets/custom_button.dart';
import 'package:emp_mobile/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  final auth_controller = Get.find<AuthController>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150,),
          Text("Login to your account.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: ColorList.bgColor
            ),
          ),

          SizedBox(height: 50,),

          // email or mobile phone
          CustomTextfield(
              hintText: "Email address or mobile phone",
              isPassword: false,
              controller: _email,
              border_color: ColorList.bgColor,
          ),

          SizedBox(height: 25,),
          // password
          CustomTextfield(
            hintText: "Password",
            isPassword: true,
            controller: _password,
            border_color: ColorList.bgColor,
          ),

          // forgot password
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: ()=>{},
                child: Text("Forgot your password?",style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
                )
            ),
          ),

          SizedBox(height: 15,),
          // Login button
          CustomButton(
              label: "Sign In",
              color: ColorList.bgColor,
              onPress: ()=> auth_controller.login(_email.text, _password.text),
          )

        ],
      ),
    );
  }
}
