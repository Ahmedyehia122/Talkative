import 'package:chat_app/features/chat/presentation/pages/chat_page.dart';
import 'package:chat_app/features/auth/presentation/pages/login_page.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SignUpPage.id: (context) => const SignUpPage(),
  LoginPage.id: (context) => const LoginPage(),
  ChatPage.id: (context) => ChatPage(),
};
