import 'package:chat_app/core/customs/custom_button.dart';
import 'package:chat_app/core/customs/custom_text_field.dart';
import 'package:chat_app/core/functions/validate_text_fields.dart';
import 'package:chat_app/features/auth/data/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/features/chat/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoginfields extends StatelessWidget {
  CustomLoginfields({super.key});

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController padsswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
            validator: (value) {
              return validateTextFields(value!, 'email');
            },
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: padsswordController,
            hintText: 'Password',
            obscureText: true,
            validator: (value) {
              return validateTextFields(value!, 'password');
            },
          ),
          SizedBox(height: 20.h),
          CustomButton(
            buttonName: 'Sign In',
            onTap: () async {
              if (formState.currentState!.validate()) {
                BlocProvider.of<ChatCubit>(context).getMessages();
                BlocProvider.of<LoginCubit>(context).signInUser(
                  emailController.text,
                  padsswordController.text,
                );
              } else {}
            },
          ),
        ],
      ),
    );
  }
}
