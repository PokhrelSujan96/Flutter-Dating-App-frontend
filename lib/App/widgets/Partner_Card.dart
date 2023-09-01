// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:datingapp/App/Models/GirlsModel.dart';
import 'package:datingapp/App/Resources/colors.dart';
import 'package:datingapp/App/Resources/images.dart';
import 'package:datingapp/App/widgets/SmallButton.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Partner_Card extends StatefulWidget {
  const Partner_Card({super.key});

  @override
  State<Partner_Card> createState() => _Partner_CardState();
}

class _Partner_CardState extends State<Partner_Card> {
  final FlareControls flareControls = FlareControls();
  bool isLiked = false;
  PageController imagesController = PageController(initialPage: 1);
  List imageList = [girl1, girl2, girl3, girl4];

  static List<String> girlName = [
    'CAROLIN SKY, 23',
    'NEHA WILLIAMS, 24',
    'JESSICA JANE, 36',
    'JENNY WILSON, 21',
  ];
  static List<String> girlLocation = [
    'Jakrata, Indonesia',
    'Mumbai, India',
    'NY, USA',
    'Surabaya, Indonesia'
  ];

  static List url = [girl1, girl5, girl2, girl4];

  final List<Girls> GirlsData = List.generate(girlName.length,
      (index) => Girls(girlName[index], '${url[index]}', girlLocation[index]));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height.h / 1.9,
      width: MediaQuery.of(context).size.width.w,
      child: PageView.builder(
          controller: imagesController,
          itemCount: GirlsData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              child: Container(
                height: MediaQuery.of(context).size.height.h,
                width: MediaQuery.of(context).size.width.w,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: partnerBg,
                    boxShadow: [
                      BoxShadow(
                          color: black, offset: Offset(7, 4), spreadRadius: 1.r)
                    ]),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height.h / 2.5,
                          width: MediaQuery.of(context).size.width.w,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: black, width: 2.r),
                            image: DecorationImage(
                                image: AssetImage(
                                  GirlsData[index].ImageUrl,
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //name & location
                                  Text(
                                    GirlsData[index].name,
                                    style: GoogleFonts.lato(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: black,
                                        size: 16.sp,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        GirlsData[index].location,
                                        style: GoogleFonts.lato(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        bottom: 70.h,
                        left: 0.w,
                        right: 0.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                imagesController.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.bounceInOut);
                              },
                              child: SmallButton(
                                  image: cancel,
                                  color1: grey.shade200,
                                  color: black,
                                  radius: 9.r,
                                  height: 50.h,
                                  width: 50.w),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                                flareControls.play("like");
                              },
                              child: SmallButton(
                                  image: heart,
                                  color1: pink,
                                  color: Colors.pinkAccent,
                                  radius: 9.r,
                                  height: 50.h,
                                  width: 50.w),
                            )
                          ],
                        )),
                    Positioned(
                      left: 120.w,
                      bottom: 250.h,
                      child: Center(
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: FlareActor(
                            'assets/images/instagram_like.flr',
                            controller: flareControls,
                            animation: 'idle',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
