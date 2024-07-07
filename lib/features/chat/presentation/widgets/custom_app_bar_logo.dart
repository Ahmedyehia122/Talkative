import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarLogo extends StatelessWidget {
  const CustomAppBarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.logoPath,
          height: 25.h,
          width: 25.w,
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          'Chat',
          style: AppStyles.whiteFont,
        ),
      ],
    );
  }
}
