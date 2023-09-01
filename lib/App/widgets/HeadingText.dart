// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:datingapp/App/Resources/colors.dart';

class HeadingText extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color1;
  final Color color2;
  final Function()? onTap;

  const HeadingText({
    Key? key,
    required this.text1,
    required this.text2,
    required this.color1,
    required this.color2,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: GoogleFonts.oswald(
                fontWeight: FontWeight.w500, color: color1, fontSize: 14.sp,letterSpacing: 0.5.r),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              text2,
              style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold, color: color2, fontSize: 10.sp),
            ),
          )
        ],
      ),
    );
  }
}
