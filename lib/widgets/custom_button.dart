import 'package:emp_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.label,required this.onPress,this.textColor=Colors.white,this.color=Colors.white});

  final String? label;
  final Color color;
  final Color textColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            overlayColor: ColorList.bgColor,
            backgroundColor: color,
            elevation: 0,
            shadowColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            )
          ),
          onPressed: onPress,
          child: Text(label!,style: TextStyle(fontSize: 18,color: textColor),)
      ),
    );
  }
}
