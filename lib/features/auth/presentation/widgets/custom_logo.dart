import 'package:chat_app/core/constants/fonts.dart';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.logoPath,
          height: 60.h,
        ),
        Text(
          'Friends Chat',
          style: AppStyles.whiteFont.copyWith(
            fontSize: 23.sp,
            fontFamily: AppFonts.playWrite,
          ),
        ),
      ],
    );
  }
}
