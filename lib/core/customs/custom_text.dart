import 'package:chat_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.textName});
  final String textName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textName,
          style: AppStyles.whiteFont.copyWith(
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }
}
