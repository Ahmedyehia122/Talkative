import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/core/customs/custom_logo.dart';
import 'package:chat_app/core/customs/custom_text.dart';
import 'package:chat_app/core/functions/custom_snack_bar.dart';
import 'package:chat_app/features/auth/data/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/features/auth/presentation/widgets/custom_sign_up_fields.dart';
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
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          BlocProvider.of<SignUpCubit>(context).isLoading = true;
        } else if (state is SignUpSuccessState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.chatPage,
              arguments: emailController.text);
          BlocProvider.of<SignUpCubit>(context).isLoading = false;
        } else if (state is SignUpFailureState) {
          showSnackBar(context, state.errMessage);
          BlocProvider.of<SignUpCubit>(context).isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: BlocProvider.of<SignUpCubit>(context).isLoading,
          child: Scaffold(
            backgroundColor: AppColors.kPrimaryColor,
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  const CustomLogo(),
                  const Spacer(flex: 2),
                  const CustomText(textName: 'SignUp'),
                  SizedBox(height: 20.sp),
                  CustomSignUpFields(),
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
                          Navigator.of(context).pushNamed(AppRoutes.loginPage);
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
            )),
          ),
        );
      },
    );
  }
}
