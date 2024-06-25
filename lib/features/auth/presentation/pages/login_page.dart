import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/fonts.dart';
import 'package:chat_app/core/constants/images.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/functions/custom_snack_bar.dart';
import 'package:chat_app/core/functions/validate_text_fields.dart';
import 'package:chat_app/core/customs/custom_button.dart';
import 'package:chat_app/core/customs/custom_text_field.dart';
import 'package:chat_app/features/chat/presentation/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'loginPage';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formState,
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Image.asset(
                    AppImages.logoPath,
                    height: 60,
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
                        'Login',
                        style: AppStyles.whiteFont.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
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
                    buttonName: 'Sign In',
                    onTap: () async {
                      if (formState.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await signInUser();

                          Navigator.of(context).pushReplacementNamed(
                              ChatPage.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                            showSnackBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                            showSnackBar(context,
                                'Wrong password provided for that user.');
                          }
                        } catch (e) {
                          showSnackBar(context,
                              'There was an error, Please try again later!');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: AppStyles.whiteFont,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign Up',
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
          ),
        ),
      ),
    );
  }

  Future<void> signInUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
