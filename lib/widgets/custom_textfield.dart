import 'package:emp_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {

  const CustomTextfield({super.key,required this.hintText,required this.isPassword,required this.controller,this.isNumber=false,this.border_color=Colors.orange});

  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool isNumber;
  final Color border_color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            fillColor: ColorList.foregroundColor,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: border_color,
                    width: 2
                )
            )
        ),
      ),
    );
  }
}
