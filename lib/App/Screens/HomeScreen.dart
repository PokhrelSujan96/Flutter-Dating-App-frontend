// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, prefer_const_constructors
// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:datingapp/App/Screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:datingapp/App/Resources/Shadow.dart';
import 'package:datingapp/App/Resources/colors.dart';
import 'package:datingapp/App/Resources/images.dart';
import 'package:datingapp/App/Screens/NearMe_Screen.dart';
import 'package:datingapp/App/widgets/AppBar.dart';
import 'package:datingapp/App/widgets/HeadingText.dart';
import 'package:datingapp/App/widgets/SmallButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: black,
        onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(seconds: 1),
                          child: Profile()),
                    );
        },
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Image.asset(
            profile,
            color: white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 14.h,
              ),
              MyAppBar(
                text: "DISCOVER",
                color: yellow,
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 0,
                    child: Padding(
                      padding: EdgeInsets.all(3.sp),
                      child: Image.asset(menu),
                    ),
                  ),
                ),
                color2: yellow,
                child2: Center(
                  child: Icon(
                    Icons.search,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              //new matches
              const HeadingText(
                  text1: "NEW MATCHES",
                  text2: "VIEW MORE",
                  color1: black,
                  color2: red),
              SizedBox(
                height: 10.h,
              ),
              NewMatches(),
              SizedBox(
                height: 25.h,
              ),
              //your dates
              HeadingText(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(seconds: 1),
                          child: NearMe()),
                    );
                  },
                  text1: "YOUR DATES",
                  text2: "VIEW MORE",
                  color1: black,
                  color2: red),
              MyDates(),
              SizedBox(
                height: 20.h,
              ),
              HeadingText(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(seconds: 1),
                          child: NearMe()),
                    );
                  },
                  text1: "NEAR YOU",
                  text2: "VIEW MORE",
                  color1: black,
                  color2: red),
              NearMeDetails(),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NearMeDetails extends StatelessWidget {
  const NearMeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NearYou(
              image: girl1,
              name: "CARLONIE SKY, 29",
              location: "INDONESIA",
              color: Color.fromARGB(255, 200, 207, 172)),
          NearYou(
              image: girl6,
              name: "RIHANA SHARMA, 23",
              location: "INDIA",
              color: Color.fromARGB(255, 202, 218, 236)),
          NearYou(
              image: girl4,
              name: "JOY WILLIAMS, 25",
              location: "LONDON",
              color: Color.fromARGB(255, 231, 177, 146)),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
    );
  }
}

class NearYou extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final Color color;
  const NearYou({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Padding(
        padding: EdgeInsets.only(left: 14.w),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: black, width: 2.r),
              boxShadow: [shadow],
              borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150.h,
                decoration: BoxDecoration(
                    border: Border.all(color: black, width: 2.r),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    color: white,
                    borderRadius: BorderRadius.circular(16.r)),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.oswald(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: black),
                      ),
                      SizedBox(
                        height: 4.r,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 15.sp,
                          ),
                          Text(
                            location,
                            style: GoogleFonts.oswald(
                                fontWeight: FontWeight.w400, color: black),
                          )
                        ],
                      )
                    ],
                  ),
                  SmallButton(
                      image: heart,
                      color1: white,
                      color: red,
                      radius: 5.r,
                      height: 40.h,
                      width: 40.w)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyDates extends StatelessWidget {
  const MyDates({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: YourDates(
                text1: "CARLINA SKY, 29",
                location: "INDONESIA",
                color: grey.shade200,
                image: girl1),
          ),
          SizedBox(
            width: 14.w,
          ),
          YourDates(
              text1: "NEHARIKA, 23",
              location: "INDIA",
              color: blue2,
              image: girl5),
          SizedBox(
            width: 14.w,
          ),
          YourDates(
              text1: "SHREYA",
              location: "NEPAL",
              color: Color.fromARGB(255, 233, 201, 198),
              image: girl6),
          SizedBox(
            width: 14.w,
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: YourDates(
                text1: "IMA JHONSON",
                location: "LONDON",
                color: grey.shade200,
                image: girl4),
          )
        ],
      ),
    );
  }
}

class YourDates extends StatelessWidget {
  final String text1;
  final String location;
  final Color color;
  final String image;
  const YourDates({
    Key? key,
    required this.text1,
    required this.location,
    required this.color,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        width: 120.w,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: black, width: 2.r),
            boxShadow: [shadow]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  border: Border.all(color: black, width: 1.5.r),
                  boxShadow: [shadow],
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                text1,
                style: GoogleFonts.oswald(
                    fontSize: 13.sp, fontWeight: FontWeight.w500, color: black),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin,
                  size: 15.sp,
                ),
                Text(
                  location,
                  style: GoogleFonts.oswald(
                      fontWeight: FontWeight.w400, color: black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NewMatches extends StatelessWidget {
  const NewMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: Matches(
              image: girl1,
              text: "HELENA CHOI",
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Matches(
            image: girl2,
            text: "JESSICA JANE",
          ),
          SizedBox(
            width: 20.w,
          ),
          Matches(
            image: girl3,
            text: "JENNY WILLIAMS",
          ),
          SizedBox(
            width: 20.w,
          ),
          Matches(
            image: girl4,
            text: "ELEANOR PENA",
          ),
          SizedBox(
            width: 20.w,
          ),
          Matches(
            image: girl5,
            text: "NEHA SHARMA",
          ),
          SizedBox(
            width: 20.w,
          ),
          Padding(
            padding: EdgeInsets.only(right: 14.w),
            child: Matches(
              image: girl6,
              text: "KRISHNA HENRY",
            ),
          ),
        ],
      ),
    );
  }
}

class Matches extends StatelessWidget {
  final String image;
  final String text;
  const Matches({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              border: Border.all(color: black, width: 1.5.r),
              boxShadow: [shadow],
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          text,
          style: GoogleFonts.oswald(fontWeight: FontWeight.w400, color: black),
        )
      ],
    );
  }
}
