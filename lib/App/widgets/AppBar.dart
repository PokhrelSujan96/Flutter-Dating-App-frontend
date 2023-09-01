// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:datingapp/App/Resources/colors.dart';

class MyAppBar extends StatelessWidget {
  final child;
  final child2;

  final String text;
  final Color color;
  final Color color2;
  final Function()? onTap;
  const MyAppBar({
    Key? key,
    required this.text,
    required this.color,
    required this.color2,
    this.onTap, this.child, this.child2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: color,
                    border: Border.all(color: black, width: 1.5.r),
                    boxShadow: [
                      BoxShadow(
                          color: black,
                          spreadRadius: 1.r,
                          offset: const Offset(2, 2)),
                    ]),
                child: child),
          ),
          Text(
            text,
            style: GoogleFonts.oswald(
                fontWeight: FontWeight.w500, color: black, fontSize: 18.sp),
          ),
          Container(
              padding: EdgeInsets.all(5.sp),
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: color2,
                  border: Border.all(color: black, width: 1.5.r),
                  boxShadow: [
                    BoxShadow(
                        color: black,
                        spreadRadius: 1.r,
                        offset: const Offset(2, 2)),
                  ]),
              child: child2),
        ],
      ),
    );
  }
}
