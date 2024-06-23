import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/customs/custom_chat_bubble.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const CustomChatBubble();
              },
            ),
          ),
          const CustomTextFormField()
        ],
      ),
    );
  }
}
