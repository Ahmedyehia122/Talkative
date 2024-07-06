import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/customs/custom_logo.dart';
import 'package:chat_app/core/customs/custom_text.dart';
import 'package:chat_app/core/functions/custom_snack_bar.dart';
import 'package:chat_app/features/auth/data/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/features/auth/presentation/widgets/custom_login_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController padsswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          BlocProvider.of<LoginCubit>(context).isLoading;
          BlocProvider.of<LoginCubit>(context).isLoading = true;
        } else if (state is LoginSuccessState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.chatPage,
              arguments: emailController.text);
          BlocProvider.of<LoginCubit>(context).isLoading = false;
        } else if (state is LoginFailureState) {
          showSnackBar(context, state.errMessage);
          BlocProvider.of<LoginCubit>(context).isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: BlocProvider.of<LoginCubit>(context).isLoading,
        child: Scaffold(
          backgroundColor: AppColors.kPrimaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  const CustomLogo(),
                  const Spacer(flex: 2),
                  const CustomText(textName: 'Login'),
                  SizedBox(height: 20.h),
                  CustomLoginfields(),
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
}
