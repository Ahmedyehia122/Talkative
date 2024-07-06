import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromWidth(Checkbox.width);
}
