// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:datingapp/App/Resources/FadeInAnimation.dart';
import 'package:datingapp/App/Resources/colors.dart';
import 'package:datingapp/App/Resources/images.dart';
import 'package:datingapp/App/widgets/AppBar.dart';
import 'package:datingapp/App/widgets/Partner_Card.dart';
import 'package:datingapp/App/widgets/SmallButton.dart';
import 'package:datingapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NearMe extends StatefulWidget {
  const NearMe({super.key});

  @override
  State<NearMe> createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> with TickerProviderStateMixin {
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
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: FadeIn(
          animation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Interval((1 / 7) * 0, 1.0, curve: Curves.fastOutSlowIn),
            ),
          ),
          controller: _animationController,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomAppBar(),
              SizedBox(
                height: 16.h,
              ),
              Partner_Card(),
              SizedBox(
                height: 16.h,
              ),
              MyNav(),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class MyNav extends StatelessWidget {
  const MyNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallButton(
              image: power,
              color1: ylw,
              color: red,
              radius: 9.r,
              height: 50.h,
              width: 50.w),
          SmallButton(
              image: star,
              color1: grey.shade200,
              color: black,
              radius: 9.r,
              height: 50.h,
              width: 50.w),
          SmallButton(
              image: chat,
              color1: grey.shade200,
              color: blue,
              radius: 9.r,
              height: 50.h,
              width: 50.w),
          SmallButton(
              image: gift,
              color1: grey.shade200,
              color: red,
              radius: 9.r,
              height: 50.h,
              width: 50.w),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      onTap: () {
        Navigator.pop(context);
      },
      text: "Near You",
      color: white,
      color2: yellow,
      child: Center(child: Icon(Icons.arrow_back_ios_new)),
      child2: Center(
        child: RotatedBox(quarterTurns: 2, child: Image.asset(menu)),
      ),
    );
  }
}
