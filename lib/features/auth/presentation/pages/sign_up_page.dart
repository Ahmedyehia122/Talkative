import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/customs/custom_button.dart';
import 'package:chat_app/core/customs/custom_logo.dart';
import 'package:chat_app/core/customs/custom_text.dart';
import 'package:chat_app/core/customs/custom_text_field.dart';
import 'package:chat_app/core/customs/question_about_having_account.dart';
import 'package:chat_app/core/functions/custom_snack_bar.dart';
import 'package:chat_app/core/functions/validate_text_fields.dart';
import 'package:chat_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController padsswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          BlocProvider.of<AuthCubit>(context).isLoading = true;
        } else if (state is SignUpSuccessState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.chatPage,
              arguments: emailController.text);
          BlocProvider.of<AuthCubit>(context).isLoading = false;
        } else if (state is SignUpFailureState) {
          showSnackBar(context, state.errMessage);
          BlocProvider.of<AuthCubit>(context).isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: BlocProvider.of<AuthCubit>(context).isLoading,
          child: Scaffold(
            backgroundColor: AppColors.kPrimaryColor,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Form(
                  key: formState,
                  child: Column(
                    children: [
                      const Spacer(flex: 1),
                      const CustomLogo(),
                      const Spacer(flex: 2),
                      const CustomText(textName: 'SignUp'),
                      SizedBox(height: 20.sp),
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
                        buttonName: 'Sign Up',
                        onTap: () async {
                          if (formState.currentState!.validate()) {
                            BlocProvider.of<ChatCubit>(context).getMessages();
                            BlocProvider.of<AuthCubit>(context).registerUser(
                              emailController.text,
                              padsswordController.text,
                            );
                          } else {}
                        },
                      ),
                      SizedBox(height: 10.h),
                      QuestionAboutHavingAccount(
                        questiontext: 'Already have an account? ',
                        buttontext: 'Login',
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.loginPage);
                        },
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
