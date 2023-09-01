// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:datingapp/App/Resources/colors.dart';
import 'package:datingapp/App/Resources/images.dart';

class SmallButton extends StatelessWidget {
  final String image;
  final Color? color1;
  final Color? color;
  final double radius;
  final double height;
  final double width;
  const SmallButton({
    Key? key,
    required this.image,
    required this.color1,
    required this.color,
    required this.radius,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.r),
          color: color1,
          border: Border.all(color: black, width: 1.5.r),
          boxShadow: [
            BoxShadow(
                color: black, spreadRadius: 1.r, offset: const Offset(2, 2)),
          ]),
      child: Center(child: Image.asset(image, color: color)),
    );
  }
}
