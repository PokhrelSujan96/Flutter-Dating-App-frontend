// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:datingapp/App/Resources/FadeInAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:datingapp/App/Resources/Shadow.dart';
import 'package:datingapp/App/Resources/colors.dart';
import 'package:datingapp/App/Resources/images.dart';
import 'package:datingapp/App/widgets/AppBar.dart';
import 'package:datingapp/App/widgets/SmallButton.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //animation--end!!

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue2,
      body: SafeArea(
        child: FadeIn(
          animation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Interval((1 / 7) * 0, 1.0, curve: Curves.fastOutSlowIn),
            ),
          ),
          controller: _animationController,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14.h,
                ),
                MyAppBar(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "MY PROFILE",
                  color: white,
                  child: Center(
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  color2: yellow,
                  child2: Center(
                    child: Image.asset(menu),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Container(
                    height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: blue2,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: black, width: 2.r),
                        image: DecorationImage(
                            image: AssetImage("assets/images/boy.jpg"),
                            fit: BoxFit.cover),
                        boxShadow: const [shadow]),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "JOHN BROOKLYN",
                      style: GoogleFonts.electrolize(
                          fontWeight: FontWeight.bold,
                          color: black,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: Text(
                    "@johnbroo.date",
                    style: GoogleFonts.electrolize(
                        fontWeight: FontWeight.w500,
                        color: black,
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    "Travel writers who wrote my own otary\nLiving my life in my style",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.electrolize(
                        fontWeight: FontWeight.w500,
                        color: black,
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                MyCategory(),
                SizedBox(
                  height: 10.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NearYou(
                          image: girl2,
                          name: "NEHA DUA, 23",
                          location: "MUMBAI",
                          color: Color.fromARGB(255, 183, 146, 146)),
                      NearYou(
                          image: girl5,
                          name: "REEMA, 21",
                          location: "KATHMANDU",
                          color: Color.fromARGB(255, 169, 201, 237)),
                      NearYou(
                          image: girl3,
                          name: "SHREYA SHARMA, 21",
                          location: "DHANGADi",
                          color: Color.fromARGB(255, 201, 175, 175)),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                NearMeDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCategory extends StatelessWidget {
  const MyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        width: MediaQuery.of(context).size.width.w,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: black, width: 2.r),
            boxShadow: const [shadow]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ContaierCat(text: "LIKES YOU"),
            ContaierCat(text: "MATCHES"),
            ContaierCat(text: "DATES")
          ],
        ),
      ),
    );
  }
}

class ContaierCat extends StatelessWidget {
  final String text;
  const ContaierCat({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 25.h,
      decoration: BoxDecoration(color: white),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.oswald(
              fontWeight: FontWeight.w500, color: black, fontSize: 13.sp),
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
          width: MediaQuery.of(context).size.width / 2.5,
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
                height: 120.h,
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
                            fontSize: 10.sp,
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
                            size: 12.sp,
                          ),
                          Text(
                            location,
                            style: GoogleFonts.oswald(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                                color: black),
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
                      height: 35.h,
                      width: 35.w)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
