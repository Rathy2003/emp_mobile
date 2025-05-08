import 'package:emp_mobile/controller/AuthController.dart';
import 'package:emp_mobile/utils/colors.dart';
import 'package:emp_mobile/widgets/custom_button.dart';
import 'package:emp_mobile/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({super.key});
  final auth_controller = Get.find<AuthController>();
  final TextEditingController _username = TextEditingController(text: "Torn Rathy");
  final TextEditingController _email = TextEditingController(text: "tornrathy@gmail.com");
  final TextEditingController _phone = TextEditingController(text: "0965051014");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 18),
        backgroundColor: ColorList.bgColor,
        title: Text("Profile Detail"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 25,),
            CustomTextfield(
              controller: _username,
              hintText: "Username",
              isPassword:false,
              border_color: ColorList.bgColor
            ),
            SizedBox(height: 25,),

            CustomTextfield(
              controller: _email,
              hintText: "Email",
              isPassword:false,
              border_color: ColorList.bgColor
            ),

            SizedBox(height: 25,),

            CustomTextfield(
              controller: _phone,
              hintText: "Phone",
              isPassword:false,
              isNumber: true,
              border_color: ColorList.bgColor
            ),

            SizedBox(height: 25,),

            // save button
            CustomButton(
                onPress: () => print("Saved"),
                color: ColorList.bgColor,
                textColor: Colors.white,
                label: "Save"
            ),

            SizedBox(height: 15,),
            CustomButton(
                onPress: () => auth_controller.logout(),
                color: Colors.grey,
                textColor: Colors.white,
                label: "Logout"
            )
          ],
        ),
      ),
    );
  }
}
