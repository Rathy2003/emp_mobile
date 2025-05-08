import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {

  const CustomTextfield({super.key,required this.hintText,required this.isPassword,required this.controller});

  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            filled: true,
            hintText: hintText,
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
    );
  }
}
