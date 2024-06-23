// custom_app_bar.dart
import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logoPath,
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Chat',
              style: AppStyles.whiteFont,
            ),
          ],
        ),
      ),
    );
  }
}