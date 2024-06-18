import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/shared/functions/custom_snack_bar.dart';
import 'package:chat_app/core/shared/functions/validate_text_fields.dart';
import 'package:chat_app/core/shared/widgets/custom_button.dart';
import 'package:chat_app/core/shared/widgets/custom_text_field.dart';
import 'package:chat_app/pages/chast_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'signUpPage';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;

  String? password;
  bool isLoading = false;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Strings.kPrimaryColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formState,
            child: Column(
              children: [
                const Spacer(flex: 1),
                Image.asset(
                  Strings.logoPath,
                  height: 60,
                ),
                Text(
                  'Friends Chat',
                  style: Styles.whiteFont.copyWith(
                    fontSize: 23,
                    fontFamily: Strings.playWrite,
                  ),
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    Text(
                      'Register',
                      style: Styles.whiteFont.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
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
                const SizedBox(height: 20),
                CustomButton(
                  buttonName: 'Sign Up',
                  onTap: () async {
                    if (formState.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        showSnackBar(context, 'Success');
                        print('dkdjknk');
                        Navigator.of(context).pushReplacementNamed(ChatPage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        showSnackBar(
                          context,
                          'There was an error, Please try again later!',
                        );
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: Styles.whiteFont,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(LoginPage.id);
                      },
                      child: Text(
                        'Login',
                        style: Styles.whiteFont.copyWith(
                          fontSize: 16,
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
  }

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
