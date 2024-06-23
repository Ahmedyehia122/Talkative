import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/widgets/floating_button.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: const SizedBox(),
        leadingWidth: 0,
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
