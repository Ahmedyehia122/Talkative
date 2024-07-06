import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/features/auth/data/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/features/auth/data/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/features/chat/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TalkativeApp extends StatelessWidget {
  const TalkativeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
          BlocProvider<SignUpCubit>(
            create: (context) => SignUpCubit(),
          ),
          BlocProvider<ChatCubit>(
            create: (context) => ChatCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.signUpPage,
          routes: routes,
        ),
      ),
    );
  }
}
