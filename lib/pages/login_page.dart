import 'package:chat_app/core/constants/Strings.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/shared/custom_button.dart';
import 'package:chat_app/core/shared/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 150, 121),
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
                  .copyWith(fontSize: 23, fontFamily: Strings.fontFamily),
            ),
            const Spacer(flex: 2),
            Row(
              children: [
                Text(
                  'Sign In ',
                  style: Styles.whiteFont.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            const CustomTextField(
              hintText: 'Password',
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonName: 'Sign In',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: Styles.whiteFont,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Sign Up',
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
}
