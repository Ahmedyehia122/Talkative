import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/fonts.dart';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/functions/custom_snack_bar.dart';
import 'package:chat_app/core/functions/validate_text_fields.dart';
import 'package:chat_app/core/customs/custom_button.dart';
import 'package:chat_app/core/customs/custom_text_field.dart';
import 'package:chat_app/features/auth/data/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatelessWidget {
  String? email;

  String? password;
  bool isLoading = false;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          isLoading = true;
        } else if (state is SignUpSuccessState) {
          Navigator.of(context)
              .pushReplacementNamed(AppRoutes.chatPage, arguments: email);
          isLoading = false;
        } else if (state is SignUpFailureState) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
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
                    Image.asset(
                      AppImages.logoPath,
                      height: 60.h,
                    ),
                    Text(
                      'Friends Chat',
                      style: AppStyles.whiteFont.copyWith(
                        fontSize: 23.sp,
                        fontFamily: AppFonts.playWrite,
                      ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        Text(
                          'Register',
                          style: AppStyles.whiteFont.copyWith(
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.sp),
                    CustomTextField(
                      hintText: 'Email',
                      obscureText: false,
                      onChanged: (p0) {
                        email = p0;
                      },
                      validator: (value) {
                        return validateTextFields(value!, 'email');
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      hintText: 'Password',
                      obscureText: true,
                      onChanged: (p0) {
                        password = p0;
                      },
                      validator: (value) {
                        return validateTextFields(value!, 'password');
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      buttonName: 'Sign Up',
                      onTap: () async {
                        if (formState.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context)
                              .registerUser(email!, password!);
                        } else {}
                      },
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: AppStyles.whiteFont,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.loginPage);
                          },
                          child: Text(
                            'Login',
                            style: AppStyles.whiteFont.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
