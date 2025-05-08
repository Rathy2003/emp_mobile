import 'package:emp_mobile/controller/AuthController.dart';
import 'package:emp_mobile/utils/colors.dart';
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
      color: ColorList.bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150,),
          Text("Login to your account.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white
            ),
          ),

          SizedBox(height: 50,),

          // email or mobile phone
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                filled: true,
                hintText: "Email address or mobile phone",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                    width: 2
                  )
                )
              ),
            ),
          ),

          SizedBox(height: 25,),
          // password
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                          width: 2
                      )
                  )
              ),
            ),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
                onPressed: ()=> auth_controller.login(_email.text, _password.text),
                child: Text("Sign In",style: TextStyle(fontSize: 18,color: Colors.black),)
            ),
          )
        ],
      ),
    );
  }
}
