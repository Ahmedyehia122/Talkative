import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/features/chat/presentation/pages/chat_page.dart';
import 'package:chat_app/features/auth/presentation/pages/login_page.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.signUpPage: (context) => const SignUpPage(),
  AppRoutes.loginPage: (context) => LoginPage(),
  AppRoutes.chatPage: (context) => ChatPage(),
};
