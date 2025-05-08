import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:emp_mobile/helper/real_time.dart';
import 'package:emp_mobile/utils/colors.dart';
import 'package:emp_mobile/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorList.bgColor,
        leadingWidth: 180,
        centerTitle: false,
        leading: Image.asset("assets/images/checkplify_logo.png",),
        actions: [
          Icon(
            Icons.notifications_outlined,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(width: 10,),
          InkWell(
            onTap: ()=> Get.toNamed("/profile"),
            child: Container(
              height: 45,
              width: 45,
              child: CircleAvatar(
                
                backgroundImage: AssetImage("assets/images/profile_1.jpg"),
              ),
            ),
          ),
          SizedBox(width: 15,),
        ],
      ),
      body: Container(
        color: ColorList.bgColor,
        child: Column(
          children: [
            SizedBox(height: 25,),
            // Employee Card
            Flexible(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // detail section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Kak Kheang",style: TextStyle(fontSize: 20,color: Colors.black),),
                        Text("01/02/1999",style: TextStyle(fontSize: 20,color: Colors.black),),
                        Text("096 594 845",style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),

                    //   profile section
                    Container(
                      height: 85,
                      width: 85,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://assets.goal.com/images/v3/blt086247a68901889e/GOAL%20-%20Blank%20WEB%20-%20Facebook%20-%202025-03-24T073412.548.png?auto=webp&format=pjpg&width=3840&quality=60"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Date and Time
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/calendar.png",height: 30,),
                        SizedBox(width: 10,),
                        Text("22/01/2025",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),

                    Row(
                      children: [
                        Image.asset("assets/images/clock.png",height: 30,),
                        SizedBox(width: 10,),
                        RealTimeClock()
                        // Text("22/01/2025",style: TextStyle(fontSize: 15,color: Colors.white),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Body
            Flexible(
              flex: 6,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)
                    )
                ),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 18,
                  ),
                  children: [
                    ActionsCard(
                      label:"Report",
                      url:"assets/images/report.png"
                    ),
                    ActionsCard(
                      label: "Request OT",
                      url: "assets/images/overtime.png",
                    ),
                    ActionsCard(
                      label: "Request Leave",
                      url: "assets/images/paper.png",

                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(
              onTap: ()=> Get.toNamed("/qrscanner"),
                child: Image.asset("assets/images/scan.png")
            ),
          )
        ],
        circleColor: Colors.white,
        circleShadowColor: Colors.black.withOpacity(0.3),
        height: 75,
        circleWidth: 75,
        activeIndex: 0,
        inactiveIcons: [
          Text("")
        ],
        elevation: 3,
        color: ColorList.bgColor,
      ),
    );
  }
}
