import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/shared/functions/custom_snack_bar.dart';
import 'package:chat_app/core/shared/widgets/custom_button.dart';
import 'package:chat_app/core/shared/widgets/custom_text_field.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static const String id = 'signUpPage';
  String? email;
  String? password;
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Strings.kPrimaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Spacer(flex: 1),
            Image.asset(
              Strings.logoPath,
              height: 60,
            ),
            Text(
              'Friends Chat',
              style: Styles.whiteFont
                  .copyWith(fontSize: 23, fontFamily: Strings.playWrite),
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
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Password',
              obscureText: true,
              onChanged: (p0) {
                password = p0;
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonName: 'Sign Up',
              onTap: () async {
                try {
                  await registerUser();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                    showSnackBar(context, 'The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                    showSnackBar(
                        context, 'The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                  showSnackBar(
                    context,
                    e.toString(),
                  );
                }
                showSnackBar(context, 'Success'); 
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
      )),
    );
  }

  Future<void> registerUser() async {
         final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
