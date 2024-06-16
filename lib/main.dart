import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Strings.signUpPage,
      routes: {
        Strings.signUpPage: (context) => const SignUpPage(),
        Strings.loginPage: (context) => const LoginPage(),
      },
    );
  }
}
