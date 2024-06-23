import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/fonts.dart';
import 'package:flutter/material.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: 15,
        ),
        decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(2),
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: const Text(
          'Wh wwwewh dbu?',
          style: TextStyle(
            color: Colors.white,
            fontFamily: AppFonts.playWrite,
          ),
        ),
      ),
    );
  }
}
