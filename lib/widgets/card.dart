import 'package:flutter/material.dart';

class ActionsCard extends StatelessWidget {
  const ActionsCard({super.key,required this.label,required this.url});
  final String? label;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0.1,0.2,),
            blurRadius: 2,
            spreadRadius: 0,
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(url!,height: 40,),
          SizedBox(height: 5,),
          Text(label!,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
