import 'package:chat_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:chat_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TalkativeApp extends StatelessWidget {
  const TalkativeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SignUpPage.id,
          routes: routes),
    );
  }
}
