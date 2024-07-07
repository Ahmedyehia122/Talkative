import 'package:chat_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionAboutHavingAccount extends StatelessWidget {
  const QuestionAboutHavingAccount({
    super.key,
    required this.questiontext,
    required this.buttontext,
    this.onTap,
  });

  final String questiontext;
  final String buttontext;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questiontext,
          style: AppStyles.whiteFont,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttontext,
            style: AppStyles.whiteFont.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
